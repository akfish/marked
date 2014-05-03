describe "Marked.Js", () ->
        it 'should exists', ->
                expect(marked?).toBe true
        it 'should parse markdown normally'
        it 'should give me tokens if I want them'
        
        describe 'Token', ->
                it 'should have location data'

                describe 'Location', ->
                        it "is correct in 'space' token"
                        it "is correct in 'code' token"
                        it "is correct in 'heading' token"
                        it "is correct in 'table' token"
                        it "is correct in 'hr' token"
                        it "is correct in 'blockquote_start' token"
                        it "is correct in 'blockquote_end' token"
                        it "is correct in 'list_start' token"
                        it "is correct in 'list_item_start' token"
                        it "is correct in 'loose_item_start' token"
                        it "is correct in 'list_item_end' token"
                        it "is correct in 'list_end' token"
                        it "is correct in 'paragraph' token"
                        it "is correct in 'html' token"
                        it "is correct in 'test' token"

