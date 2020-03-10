note
	description: "Summary description for {REMOVE_LATEST_TESTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	REMOVE_LATEST_TESTS

inherit
	STATIC_TESTS

feature

	how_many (t: INT_LINKED_LIST; a_value: INTEGER): INTEGER
		-- return how many times `a_value' occurs in `t'
	local
		current_element: INT_LINKABLE
	do
		if t.count=0 then
			Result := 0
		else
			from current_element := t.first_element
			until current_element = Void
			loop
				if current_element.value = a_value then
					Result := Result + 1
				end
				current_element := current_element.next
			end
		end
	end

	t_remove_latest
		do
			t_single_value_first (1)
			t_single_value_middle (1)
			t_single_value_last (1)
--			t_remove_latest_with (1)
--			t_remove_latest_with (2)
--			t_remove_latest_with (3)
--			t_remove_latest_not_existing (1)
--			t_remove_latest_not_existing (2)
--			t_remove_latest_not_existing (3)
		end

	t_single_value_first (a_value: INTEGER)
		local
			t: INT_LINKED_LIST
			count_prima, count_dopo: INTEGER
		do
			create t
			t.append (a_value)
			t.append (2)
			t.append (3)
			count_prima := how_many(t, a_value)
			t.remove_latest(a_value)
			count_dopo := how_many(t, a_value)
			assert("count prima e dopo scorretto", count_prima = count_dopo + 1)
		end

	t_single_value_middle (a_value: INTEGER)
		local
			t: INT_LINKED_LIST
			count_prima, count_dopo: INTEGER
		do
			create t
			t.append (2)
			t.append (a_value)
			t.append (3)
			count_prima := how_many(t, a_value)
			t.remove_latest(a_value)
			count_dopo := how_many(t, a_value)
			assert("count prima e dopo scorretto", count_prima = count_dopo + 1)
		end

	t_single_value_last (a_value: INTEGER)
		local
			t: INT_LINKED_LIST
			count_prima, count_dopo: INTEGER
		do
			create t
			t.append (2)
			t.append (3)
			t.append (a_value)
			count_prima := how_many(t, a_value)
			t.remove_latest(a_value)
			count_dopo := how_many(t, a_value)
			assert("count prima e dopo scorretto", count_prima = count_dopo + 1)
		end

	t_remove_latest_with (a_value: INTEGER)
		local
			t: INT_LINKED_LIST
		do
			create t
			t.append(a_value)
			t.remove_latest(a_value)
			assert("implementata per lista con 1 solo elemento", not t.has (a_value))
		end

	t_remove_latest_not_existing (a_value: INTEGER)
		local
			t: INT_LINKED_LIST
		do
			create t
			t.append(a_value)
			t.remove_latest(2*a_value)
			assert("implementata per lista con 1 solo elemento", t.has (a_value))
		end


end
