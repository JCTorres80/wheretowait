# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
ready = (event) ->

  typeaheadInput = $('.typeahead')

  locations = new Bloodhound
    datumTokenizer: (d) -> Bloodhound.tokenizers.whitespace(d.name),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: '/locations.json?search=%QUERY'

  locations.initialize()

  typeaheadInput.typeahead null,
    name:'locations',
    displayName:'name',
    source: locations.ttAdapter(),
    templates:
      suggestion:
        Handlebars.compile ['<p class="location-type">{{location_type}}</p>', '<address><strong>{{name}}</strong>','<br>{{address}}','<br>{{city}}, {{state}} {{zip_code}}','</address>'].join('')


  typeaheadInput.on 'typeahead:initialized', (event) =>
    console.log event

  typeaheadInput.on 'typeahead:opened', (event) =>
    console.log event

  typeaheadInput.on 'typeahead:closed', (event) =>
    console.log event

  typeaheadInput.on 'typeahead:cursorchanged', (event, suggestion, name) =>
    console.log event
    typeaheadInput.val suggestion.name

  typeaheadInput.on 'typeahead:selected', (event, suggestion, name) =>
    typeaheadInput.val suggestion.name
    window.location.href = '/locations/' + suggestion.id

  typeaheadInput.on 'typeahead:autocompleted', (event, suggestion, name) =>
    console.log event


$(document).ready ready
$(document).on 'page:load', ready
