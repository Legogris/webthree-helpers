function(eth_apply TARGET REQUIRED)
	find_package (CURL)
	eth_show_dependency(CURL curl)

	if (CURL_FOUND)
		if (STATIC_LINKING)
			eth_use(${TARGET} OPTIONAL SSH2)
			eth_use(${TARGET} OPTIONAL OpenSSL)
			eth_use(${TARGET} OPTIONAL ZLIB)
		endif()
		target_include_directories(${TARGET} SYSTEM PUBLIC ${CURL_INCLUDE_DIRS})
		target_link_libraries(${TARGET} ${CURL_LIBRARIES})
	elseif (NOT ${REQUIRED} STREQUAL "OPTIONAL")
		message(FATAL_ERROR "Curl library not found")
	endif()
endfunction()
