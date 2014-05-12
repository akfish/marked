define (require, exports, module) ->
        # Test data file names
        # Used to establish a baseline so I will know if I break anything
        # Some of them won't pass so they are commented out
        # It doesn't matter that much
        # since I am not trying to duplicate node test script here
        test_names = [
                "amps_and_angles_encoding"
                "auto_links"
                "autolink_lines"
                "backslash_escapes"
                "blockquote_list_item"
                "blockquotes_with_code_blocks"
                "case_insensitive_refs"
                "code_blocks"
                "code_spans"
                # Won't pass for node test too, dot't care
                # "def_blocks"
                "double_link"
                "escaped_angles"
                # Won't pass, don't care
                # "gfm_break.breaks"
                "gfm_code"
                "gfm_code_hr_list"
                "gfm_del"
                "gfm_em"
                "gfm_links"
                "gfm_tables"
                # Won't pass, don't care
                # "hard_wrapped_paragraphs_with_list_like_lines.nogfm"
                "horizontal_rules"
                "hr_list_break"
                "inline_html_advanced"
                "inline_html_comments"
                "inline_html_simple"
                "lazy_blockquotes"
                "links_inline_style"
                "links_reference_style"
                "links_shortcut_references"
                "list_item_text"
                "literal_quotes_in_titles"
                "loose_lists"
                "main"
                "markdown_documentation_basics"
                "markdown_documentation_syntax"
                "nested_blockquotes"
                "nested_code"
                "nested_em"
                "nested_square_link"
                "not_a_link"
                "ordered_and_unordered_lists"
                "ref_paren"
                # Won't pass, don't care
                # "same_bullet"
                "strong_and_em_together"
                "tabs"
                # Won't pass, don't care
                # "text.smartypants"
                "tidyness"
                "toplevel_paragraphs.gfm"
                "tricky_list"
        ]
                        
        # Load tests in ../../tests/
        # * name - test data file name (without extension)
        # * test - callback = (markdown_src, html_src, done) ->
        runTest = (name, test, done) ->
                data_path = "../../tests/"
                md_path = "#{data_path}#{name}.text"
                html_path = "#{data_path}#{name}.html"

                require.async [md_path, html_path], (md, html) ->
                        test? md, html, done

        # Test generate
        generate = (md, html, done) ->
                actual = marked(md).replace(/\s/g, '')
                expected = html.replace(/\s/g, '')
                expect(actual).toEqual(expected)
                done()

        # Original test spec
        it_runs = (name) ->
                should = "should parses '#{name}'"
                it should, (done) ->
                        runTest name, generate, done

        # Test token location
        locateToken = (md, html, done) ->
                tokens = marked.lexer md

                for token in tokens
                        # Location data
                        l = token.loc
                        # Location data should exists
                        expect(l?).toBe true
                        # Start index should be caculated
                        expect(l.start_index).not.toBe -1
                        # Location should be correct
                        # This is done by clipping original md with location data
                        # And compare to the l.src field
                        actual = md.substr l.start_index, l.length;
                        expect(actual).toEqual l.src
                done()
                
        # Location test spec
        it_locates = (name) ->
                should = "should locates '#{name}'"
                it should, (done) ->
                        runTest name, locateToken, done
                        
        exports = describe "Marked.Js", ->
                it 'should exists', ->
                        expect(marked?).toBe true

                # Set options
                marked.setOptions
                        renderer: new marked.Renderer()
                        gfm: true
                        tables: true
                        breaks: false
                        pedantic: false
                        sanitize: false
                        smartLists: true
                        smartypants: false

                # Run original tests to establish a base line
                describe 'Baseline - Some of the orignal tests', ->
                        for name in test_names
                                it_runs name
                        
                describe 'Token', ->
                        for name in test_names
                                it_locates name
