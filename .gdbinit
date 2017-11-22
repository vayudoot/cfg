set history save on
set print pretty on
set pagination off
set confirm off
set disassembly-flavor intel
set disassemble-next-line on

# to catch ptrace and set RAX to 0 always
# after ptrace syscall
catch syscall ptrace
    commands 1
    set ($eax) = 0
    continue
end

define print_vmas
    set $mm = (struct mm_struct *) $arg0
    set $vma = $mm->mmap
    while $vma
        if $vma->vm_file
            printf "%s: start = %x, end = %x, flags = %x\n", \
                   $vma->vm_file->f_path.dentry.d_name.name, \
                   $vma->vm_start, $vma->vm_end, $vma->vm_flags
        else
            printf "anon: start = %x, end = %x, flags = %x\n", \
            $vma->vm_start, $vma->vm_end, $vma->vm_flags
        end
        set $vma = $vma->vm_next
    end
end

define page_indexes
    set $addr = (unsigned long long) $arg0
    set $page_offset = ($addr & 0xfff)
    set $pte_index = (($addr >> 12) & 0x1ff)
    set $pmd_index = (($addr >> 21) & 0x1ff)
    set $pud_index = (($addr >> 30) & 0x1ff)
    set $pgd_index = (($addr >> 39) & 0x7f)
    printf "addr = 0x%x: pgd_index = %d, pud_index = %d, pmd_index = %d, pte_index = %d, page_offset = %x\n", \
           $addr, $pgd_index, $pud_index, $pmd_index, $pte_index, $page_offset
end

define page_table_entries
    set $mm = (struct mm_struct *) $arg0
    set $addr = (unsigned long long) $arg1

    set $page_offset = ($addr & 0xfff)
    set $pte_index = (($addr >> 12) & 0x1ff)
    set $pmd_index = (($addr >> 21) & 0x1ff)
    set $pgd_index = (($addr >> 30) & 0x3ff)

    set $pmd = (pmd_t *) $mm->pgd[$pgd_index].pgd
    set $pte = (pte_t *) $pmd[$pmd_index].pmd
    set $entry = $pte[$pte_index]->pte

    printf "addr = 0x%llx: pgd = 0x%llx, pmd = 0x%llx, pte = 0x%llx, entry = 0x%llx\n", \
           $addr, $mm->pgd, $pmd, $pte, $entry
end


define addr_from_pte
    set $mm = (struct mm_struct *) $arg0
    set $addr = (unsigned long long) $arg1
    set $pte2 = (pte_t *) $arg2

    set $page_offset = ($addr & 0xfff)
    set $pte_index = (($addr >> 12) & 0x1ff)
    set $pmd_index = (($addr >> 21) & 0x1ff)
    set $pgd_index = (($addr >> 30) & 0x3ff)

    set $pmd = (pmd_t *) $mm->pgd[$pgd_index].pgd
    set $pte = (pte_t *) $pmd[$pmd_index].pmd
    set $entry = $pte->pte

    set $new_addr = ($addr & 0x1fffff)

    printf "addr = 0x%llx: pgd = 0x%llx, pmd = 0x%llx, pte = 0x%llx, entry = 0x%llx\n", \
           $addr, $mm->pgd, $pmd, $pte, $entry
end

define decode_entry
    set $entry = (unsigned long long) $arg0
    set $present_set = ($entry & 0x1)
    set $read_set = ($entry & 0x2)
    set $write_set = ($entry & 0x4)
    set $accessed_set = ($entry & 0x8)
    set $modified_set = ($entry & 0x10)

    if $present_set
        printf "PRESENT "
    end
    if $read_set
        printf "READ "
    end
    if $write_set
        printf "WRITE "
    end
    if $accessed_set
        printf "ACCESSED "
    end
    if $modified_set
        printf "MODIFIED/FILE "
    end

    printf "\n"
    set $entrylo = ($entry >> 6)
    printf "entrylo[01] = 0x%llx\n", $entrylo
    printf "(entrylo[01] >> 6) = 0x%llx\n", ($entrylo >> 6)
end

