MODULES = agent

all: $(MODULES)

.PHONY: $(MODULES)
$(MODULES): DIR=lib/hs-api/$@
$(MODULES): %: %.thrift
	# ruby
	mkdir -p $(DIR)
	thrift -out $(DIR) --gen rb $<
	cd $(DIR); mv $@_types.rb types.rb
	cd $(DIR); mv $@_constants.rb constants.rb
	cd $(DIR); sed -i -e "s/$@_types/$@\/types/" *.rb
	
	# python (ssh gateway)
	mkdir -p lib-python
	thrift -out lib-python --gen py $< 
	
