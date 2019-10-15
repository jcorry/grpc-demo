package api

type Server struct {
}

// Upload accepts a FileUpload argument, uploads the file to Cloudinary and returns
// an UploadStatus
func (s *Server) Upload(u FileUpload) UploadStatus {
	return UploadStatus{}
}

// Read accepts a FileIdentifier and uses it to look up a file at Cloudinary
// returning the photo found
func (s *Server) Read(i FileIdentifier) Photo {
	return Photo{}
}

// List returns a list of files that have been uploaded to the service and been stored
// at Cloudinary
func (s *Server) List() FileIdentifierList {
	return FileIdentifierList{}
}
