// app/javascript/components/select2.js
import $ from 'jquery';
import 'select2';

var link = `<span display= 'none'> No Results Found

<a href=''
data-toggle='modal' id='trigger' data-target='#myModal'> Créer nouveau contact</a>
</span>`;

function formatState (state) {
  if (!state.id) {
    return state.text;
  }
  var baseUrl = "/user/pages/images/flags";
  var $state = $(
    '<span><img src="' + baseUrl + '/' + state.element.value.toLowerCase() + '.png" class="img-flag" /> ' + state.text + '</span>'
  );
  return $state;
};


$('.select2').select2({
  // tags: true,
  theme: "bootstrap",

  "language": {
      "noResults": function(){
          return link;
      }
  },
  escapeMarkup: function (markup) {
    return markup;
   },

});

$('.select2_basic').select2({

  theme: "bootstrap",

});

$('.selecttwo').select2({
  tags: true
});


// Requiring CSS! Path is relative to ./node_modules
import 'select2/dist/css/select2.css';
import 'select2-bootstrap-theme/dist/select2-bootstrap.css';
import 'select2/dist/js/select2.full.js';
