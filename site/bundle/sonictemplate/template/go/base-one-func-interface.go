package {{_name_:main}}

import "fmt"

type Handler interface {
	Serve(some any) error
}

type HandlerFunc func(some any) error

func (f HandlerFunc) Serve(some any) error {
	return f(some)
}

func Handle(h Handler, some any) error {
	err := h.Serve(some)
	if err != nil {
		return fmt.Errorf(" %w", err)
	}

	return nil
}
{{_cursor_}}
