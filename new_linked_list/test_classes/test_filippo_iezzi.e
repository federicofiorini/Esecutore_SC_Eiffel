note
	description: "Summary description for {TEST_FILIPPO_IEZZI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_FILIPPO_IEZZI

inherit
	STATIC_TESTS

feature

	t_filippo_iezzi
		--test di varie feature combinate 2020/03/17
	local
		t: INT_LINKED_LIST
	do
		create t
		assert("la lista � vuota, active element � void",t.active_element=Void)
		t.append(5) --ho messo 5 alla fine
		t.prepend(8) --ho messo 8 all'inizio
		assert("ho inserito 8 in testa", t.first_element /= Void and then (attached t.first_element as fe implies fe.value=8))
		assert("ho inserito 5 in coda, la lista ha 5 come last", check_is_last(t,5))
		t.insert_after (7, 5)
	end

	check_is_last (t: INT_LINKED_LIST; a_value: INTEGER): BOOLEAN
	do

	Result:=t.last_element /= Void and then (attached t.last_element as le implies le.value=a_value)

	end

	check_is_active (t: INT_LINKED_LIST; a_value: INTEGER): BOOLEAN
	do

	Result:=t.active_element /= Void and then (attached t.active_element as ae implies ae.value=a_value)

	end

end
