// Generated by CoffeeScript 1.6.3
(function() {
  describe("Marked.Js", function() {
    it('should exists', function() {
      return expect(typeof marked !== "undefined" && marked !== null).toBe(true);
    });
    it('should parse markdown normally');
    it('should give me tokens if I want them');
    return describe('Token', function() {
      it('should have location data');
      return describe('Location', function() {
        it("is correct in 'space' token");
        it("is correct in 'code' token");
        it("is correct in 'heading' token");
        it("is correct in 'table' token");
        it("is correct in 'hr' token");
        it("is correct in 'blockquote_start' token");
        it("is correct in 'blockquote_end' token");
        it("is correct in 'list_start' token");
        it("is correct in 'list_item_start' token");
        it("is correct in 'loose_item_start' token");
        it("is correct in 'list_item_end' token");
        it("is correct in 'list_end' token");
        it("is correct in 'paragraph' token");
        it("is correct in 'html' token");
        return it("is correct in 'test' token");
      });
    });
  });

}).call(this);
