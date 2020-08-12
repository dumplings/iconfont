@font-face {
    font-family: "<%= fontName %>" !important;
    src: url('<%= fontPath %><%= fontName %>.woff') format('woff'),  /* chrome, firefox */
         url('<%= fontPath %><%= fontName %>.ttf') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
         url('<%= fontPath %><%= fontName %>.svg#<%= fontName %>') format('svg');
    font-weight: normal;
    font-style: normal;
}

.<%= cssClass %> {
    display: inline-block;
    /* use !important to prevent issues with browser extensions that change fonts */
    font-family: <%= fontName %> !important;
    speak: none;
    font-style: normal;
    font-weight: normal;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    vertical-align: baseline;

    /* Better Font Rendering =========== */
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

<% _.each(glyphs, function(glyph) { %>
.<%= cssClass %>-<%= glyph.fileName %>::before {
    content: "\<%= glyph.codePoint %>";
}
<% }); %>
