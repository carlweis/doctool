function uploadAttachment(attachment, event) {
  var file = attachment.file;
  var form = new FormData;
  form.append("Content-Type", file.type);
  form.append("attachment[file]", file);

  var xhr = new XMLHttpRequest;
  xhr.open("POST", `/attachments.json`, true);
  xhr.setRequestHeader(
    "X-CSRF-Token",
    document.querySelector("meta[name='csrf-token']")
      .getAttribute("content")
  );

  xhr.upload.onprogress = function(event) {
    var progress = event.loaded / event.total * 100;
    attachment.setUploadProgress(progress);
  }

  xhr.onload = function() {
    if (xhr.status === 200) {
      var data = JSON.parse(xhr.responseText);
      attachment.setAttributes({
        url: data.file.url,
        href: data.file.url,
      });
    }
  }
  return xhr.send(form);
}

// listen for trix attachment add event
document.addEventListener("trix-attachment-add", function(event) {
  var attachment = event.attachment;

  if (attachment.file) {
    return uploadAttachment(attachment, event);
  }
});
