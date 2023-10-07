-- plugins/config/indent_blankline.lua

local indent_blankline_setting = {}

function indent_blankline_setting.setup()
    -- Enable showing the current context in the indent-blankline
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_buftype_exclude = { 'dashboard', 'alpha' }

    -- Setting up the indent_blankline plugin
    require("indent_blankline").setup {
        -- Character to represent each indentation level
        char = '▏',

        -- Character to represent the current context level in the indentation
        -- NOTE: There was a bug where it was switching to default when switching context
        context_char = '▏',

        -- Enable showing the current context in the indent-blankline
        show_current_context = true,

        -- Enable underlining the start of the current context in the indent-blankline
        show_current_context_start = true,

        -- Disable intdent_blankline for following buffer types
        buftype_exclude = { 'terminal', 'nofile', 'NvimTree' },

        -- Disable intdent_blankline for following file types
        filetype_exclude = { 'help', 'packer', 'startify', 'NvimTree', 'alpha' },

        -- Uncomment the line below to use Treesitter for determining indentation levels
        -- use_treesitter = true,

        -- Context patterns determine which Treesitter nodes should be considered as a context
        -- The following are Treesitter node types for various programming constructs
        -- For a detailed understanding of each, refer to the Treesitter documentation for the respective language
        context_patterns = {
            "abstract_class_declaration", "abstract_method_signature",
            "accessibility_modifier", "ambient_declaration", "arguments", "array",
            "array_pattern", "array_type", "arrow_function", "as_expression",
            "asserts", "assignment_expression", "assignment_pattern",
            "augmented_assignment_expression", "await_expression",
            "binary_expression", "break_statement", "call_expression",
            "call_signature", "catch_clause", "class", "class_body",
            "class_declaration", "class_heritage", "computed_property_name",
            "conditional_type", "constraint", "construct_signature",
            "constructor_type", "continue_statement", "debugger_statement",
            "declaration", "decorator", "default_type", "do_statement",
            "else_clause", "empty_statement", "enum_assignment", "enum_body",
            "enum_declaration", "existential_type", "export_clause",
            "export_specifier", "export_statement", "expression",
            "expression_statement", "extends_clause", "finally_clause",
            "flow_maybe_type", "for_in_statement", "for_statement",
            "formal_parameters", "function", "function_declaration",
            "function_signature", "function_type", "generator_function",
            "generator_function_declaration", "generic_type", "if_statement",
            "implements_clause", "import", "import_alias", "import_clause",
            "import_require_clause", "import_specifier", "import_statement",
            "index_signature", "index_type_query", "infer_type",
            "interface_declaration", "internal_module", "intersection_type",
            "jsx_attribute", "jsx_closing_element", "jsx_element", "jsx_expression",
            "jsx_fragment", "jsx_namespace_name", "jsx_opening_element",
            "jsx_self_closing_element", "labeled_statement", "lexical_declaration",
            "literal_type", "lookup_type", "mapped_type_clause",
            "member_expression", "meta_property", "method_definition",
            "method_signature", "module", "named_imports", "namespace_import",
            "nested_identifier", "nested_type_identifier", "new_expression",
            "non_null_expression", "object", "object_assignment_pattern",
            "object_pattern", "object_type", "omitting_type_annotation",
            "opting_type_annotation", "optional_parameter", "optional_type", "pair",
            "pair_pattern", "parenthesized_expression", "parenthesized_type",
            "pattern", "predefined_type", "primary_expression", "program",
            "property_signature", "public_field_definition", "readonly_type",
            "regex", "required_parameter", "rest_pattern", "rest_type",
            "return_statement", "sequence_expression", "spread_element",
            "statement", "statement_block", "string", "subscript_expression",
            "switch_body", "switch_case", "switch_default", "switch_statement",
            "template_string", "template_substitution", "ternary_expression",
            "throw_statement", "try_statement", "tuple_type",
            "type_alias_declaration", "type_annotation", "type_arguments",
            "type_parameter", "type_parameters", "type_predicate",
            "type_predicate_annotation", "type_query", "unary_expression",
            "union_type", "update_expression", "variable_declaration",
            "variable_declarator", "while_statement", "with_statement",
            "yield_expression"
        }
    }
end

return indent_blankline_setting
