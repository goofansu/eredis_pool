ERL=erl
BEAMDIR=./deps/*/ebin ./ebin
REBAR=./rebar

all: get-deps compile

update-deps:
	@$(REBAR) update-deps

get-deps:
	test -d deps || ./rebar get-deps

compile:
	@$(REBAR) compile

xref:
	@$(REBAR) xref skip_deps=true

clean:
	@$(REBAR) clean

eunit:
	@rm -rf .eunit
	@mkdir -p .eunit
	@ERL_FLAGS="-config test.config" $(REBAR) skip_deps=true eunit

test: eunit

edoc:
	@$(REBAR) skip_deps=true doc
