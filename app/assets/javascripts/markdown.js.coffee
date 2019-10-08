class window.Editor

  constructor: (@textArea, @previewArea) ->
    @flag = false
    @onTextAreaKeyup @textArea
    @onDropTextArea @textArea
    @initPreview() if @textArea.size() == 1
    if @textArea.size() >= 2
      @textArea.each (i) =>
        currentTextArea = @textArea[i]
        @preview($(currentTextArea).val()).then( (data) =>
          $(currentTextArea).siblings(@previewArea).html data
        )

  initPreview: () =>
    @preview(@textArea.val()).then( (data) =>
      @previewArea.html data
      @flag = false
    ) if @isPreviewable(@textArea)

  onTextAreaKeyup: (target) ->
    $(document).on 'keyup', target, (e) =>
      if $(e.target).hasClass("js-questionForm") || $(e.target).hasClass("js-introductionForm")
        return if @flag is true
        @flag = true
        @preview($(e.target).val()).then( (data) =>
          $(e.target).siblings(@previewArea).html data
          @flag = false
        )

  onDropTextArea: (target) =>
    reader = new FileReader();
    reader.onload = (e) =>
      index = target.attr('id').indexOf('question');
      @uploadFile(e.target.result, index).then( (data) =>
        target[0].value = target[0].value.replace(@markdownText, "![#{data.response.file_name}](#{data.response.file_name})")
        @preview(@textArea.val()).then( (data) =>
          @previewArea.html data
          @flag = false
        )
      )
    target.on 'dragenter', (e) =>
      e.preventDefault();
    target.on 'dragover', (e) =>
      e.preventDefault();
    target.on 'drop', (e) =>
      e.preventDefault();
      file = e.originalEvent.dataTransfer.files[0];
      if file.type.match(/image.*/)
        @markdownText  = "![Uploading...](#{file.name})"
        target[0].value = target[0].value.substring(0, target[0].selectionEnd) + @markdownText
        reader.readAsDataURL(file)

  preview: (markdown) =>
    return $.ajax(
      url: "/markdown_previews",
      data:
        markdown: markdown
      type: 'POST'
      dataType: 'html'
    )

  uploadFile: (file, index) =>
    return $.ajax(
      url: "/markdown_attachments",
      data:
        image_data: file,
        index: index
      type: 'POST'
    )

  isPreviewable: (target) =>
    target.val().length
