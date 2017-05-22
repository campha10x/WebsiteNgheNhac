/// <reference path="../ckfinder/ckfinder.html" />
/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true; 
    config.language = 'vi';
    config.filebrowserBrowseUrl = '/asset/admin/js/Pluggin/ckfinder/ckfinder.html',
    config.filebrowserImageBrowseUrl = '/asset/admin/js/Pluggin/ckfinder/ckfinder.html?type=Images',
    config.filebrowserFlashBrowseUrl = '/asset/admin/js/Pluggin/ckfinder/ckfinder.html?type=Flash',
    config.filebrowserUploadUrl = '/asset/admin/js/Pluggin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files&currentFolder=/archive/',
    config.filebrowserImageUploadUrl = '/Data',
    config.filebrowserFlashUploadUrl = '/asset/admin/js/Pluggin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
    CKFinder.setupCKEditor(null, '/asset/admin/js/Pluggin/ckfinder/');
};
