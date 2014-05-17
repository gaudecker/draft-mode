# Description

Draft-mode enables your thoughts to flow into your drafts by disabling
the ability to edit what you've already written and inserting any new
text always at the end of the buffer.

Using draft-mode usually results in pretty rough drafts with a ton of
typing errors, but makes it harder to forget things that could be lost
when focusing on editing and restructuring text.

## Installation

Add draft-mode.el to your load-path:

    (add-to-list 'load-path "~/.emacs.d/vendor/draft-mode")

The it can be required as usual

    (require 'draft-mode)

## Usage

Enabling draft-mode should work on most buffers:

    M-x draft-mode
