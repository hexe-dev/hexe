package ast

import (
	"strings"

	"github.com/hexe-dev/hexe/internal/compiler/token"
)

//
// Comment
//

type CommentPosition int

const (
	CommentTop CommentPosition = iota
	CommentBottom
)

type Comment struct {
	Token    *token.Token
	Position CommentPosition
}

var _ (Node) = (*Comment)(nil)

func (c *Comment) Format(sb *strings.Builder) {
	sb.WriteString("# ")
	sb.WriteString(strings.TrimSpace(c.Token.Value))
}
