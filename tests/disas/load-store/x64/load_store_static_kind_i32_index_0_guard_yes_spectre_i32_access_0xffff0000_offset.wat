;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    %rdi, %rax
;;       movl    %edx, %edi
;;       xorq    %rsi, %rsi
;;       movq    %rax, %rdx
;;       movq    %rdi, %rax
;;       addq    0x40(%rdx), %rax
;;       movl    $0xffff0000, %edx
;;       leaq    (%rax, %rdx), %r11
;;       cmpq    $0xfffc, %rdi
;;       cmovaq  %rsi, %r11
;;       movl    %ecx, (%r11)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    %rdi, %rax
;;       movl    %edx, %edi
;;       xorq    %rsi, %rsi
;;       movq    %rax, %rcx
;;       movq    %rdi, %rax
;;       addq    0x40(%rcx), %rax
;;       movl    $0xffff0000, %ecx
;;       leaq    (%rax, %rcx), %r11
;;       cmpq    $0xfffc, %rdi
;;       cmovaq  %rsi, %r11
;;       movl    (%r11), %eax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
