function uploadAttachment(attachment, event) {
  var file = attachment.file;
  var form = new FormData;
  form.append("Content-Type", file.type);
  form.append("document[attachments][]", file);
  form.append(
    "document[title]",
    document.querySelector("#document_title").value
  );
  form.append(
    "document[content]",
    document.querySelector("#document_content").value
  );

  record_id = event.target.dataset["id"];
  if (record_id) {
    form.append("id", event.target.dataset["id"]);
  }

  var xhr = new XMLHttpRequest;
  if (record_id) {
    xhr.open("PUT", `/documents/${record_id}.json`, true);
  } else {
    xhr.open("POST", `/documents.json`, true);
  }
  xhr.setRequestHeader(
    "X-CSRF-Token",
    document.querySelector("meta[name='csrf-token']").getAttribute("content")
  );

  xhr.upload.onprogress = function(event) {
    var progress = event.loaded / event.total * 100;
    attachment.setUploadProgress(progress);
  }

  xhr.onload = function() {
    if (xhr.status === 201) {
      var data = JSON.parse(xhr.responseText);
      console.log("trix upload response text", xhr.responseText);
      attachment.setAttributes({
        url: data.attachments[data.attachments.length-1].url,
        href: data.attachments[data.attachments.length-1].url,
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
