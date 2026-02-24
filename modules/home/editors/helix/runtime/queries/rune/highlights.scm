; query/highlights.scm

; General
(comment) @comment
(identifier) @variable ; Fallback for identifiers

; Punctuation
[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  ";"
  ","
  "."
  "::"
] @punctuation.delimiter

(template_interpolation
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

; Keywords
[
  "fn"
  "let"
  "const"
  "return"
  "if"
  "else"
  "loop"
  "while"
  "for"
  "break"
  "continue"
  "match"
  "in"
  "use"
  "mod"
  "pub"
  "impl"
  "async"
  "struct"
  "enum"
] @keyword

(visibility_modifier) @keyword.storage
(path_keyword) @constant.builtin ; crate, self, super

; Operators
[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "|="
  "&="
  "^="
  "<<="
  ">>="
  "!"
  "-"
  "||"
  "&&"
  "|"
  "^"
  "&"
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "<<"
  ">>"
  "+"
  "*"
  "/"
  "%"
  ".."
  "..="
  "=>"
  ":"
  "#"
  "?"
] @operator

; Literals
(integer) @number
(float) @float
(boolean) @boolean
(byte) @string.special
(char) @string.special
(static_string) @string
(template_chars) @string

; Constants
(const_statement
  name: (identifier) @constant)
(unit) @constant.builtin

; Types and Modules
(struct_declaration
  name: (identifier) @type)
(enum_declaration
  name: (identifier) @type)
(impl_declaration
  name: (path) @type)
(module_declaration
  name: (identifier) @namespace)
(use_declaration
  (path) @include)

; Functions and Macros
(fn_declaration
  name: (identifier) @function)
(macro_invocation
  macro: (path) @function.macro)

; Parameters and Bindings
(parameter
  name: (identifier) @parameter)
(let_statement
  name: (identifier) @variable.binding)
(for_expression
  pattern: (identifier) @variable.binding)
(identifier_pattern) @variable.binding

; Fields and Properties
(member_expression
  property: [
    (identifier) @property
    (await_keyword) @property
  ])
(struct_field
  name: (identifier) @field)
(struct_pattern_field
  name: (identifier) @field)
(struct_pattern_shorthand
  name: (identifier) @variable.binding @field)
(object_pattern_field
  key: [
    (static_string) @property
    (identifier) @property
  ])
(object_pattern_shorthand
  name: (identifier) @variable.binding @property)

; Constructors (Enum Variants)
(enum_variant
  name: (identifier) @constructor)
(enum_variant_pattern
  path: (path) @constructor)

; Labels
(loop_label
  name: (identifier) @label)
(break_statement
  "'" (identifier) @label)
(continue_statement
  "'" (identifier) @label)
