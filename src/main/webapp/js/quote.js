const category = 'inspirational'
$.ajax({
    async:true,
    method: 'GET',
    url: 'https://api.api-ninjas.com/v1/quotes?category=' + category,
    headers: { 'X-Api-Key': apiNinjaKey},
    contentType: 'application/json',
    error: function ajaxError(jqXHR) {
        console.error('Error: ', jqXHR.responseText);
    }
}).done(function (data) {
    console.log(data)
    let author = data[0].author;
    let quote = data[0].quote;
    console.log(author);
    let finale = '<figure class="text-center">' +
        '<blockquote class="blockquote" id="quote">' +
        '<p class="display-3">"' + quote + '"</p>' +
        '</blockquote>' +
        '<figcaption class="blockquote-footer" id="caption">' + author + '</figcaption>' +
        '</figure>';
    $('#quote').html(finale);
});