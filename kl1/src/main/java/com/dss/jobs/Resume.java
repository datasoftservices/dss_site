package com.dss.jobs;

import org.springframework.web.multipart.MultipartFile;

public class Resume {

		private MultipartFile file;

		public MultipartFile getFile() {
			return file;
		}

		public void setFile(MultipartFile file) {
			this.file = file;
		}
		
		
}
