; ModuleID = 'main_module'
source_filename = "main_module"

@hello = private unnamed_addr constant [17 x i8] c"Hello, LLVM IR!\0A\00", align 1

define i32 @main() {
entry:
  ret i32 0
}
