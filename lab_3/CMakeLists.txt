cmake_minimum_required(VERSION 3.11)

project(functions CXX)

set(CMAKE_CXX_STANDARD 23)

# Специфичные настройки для компилятора Visual Studio
if(MSVC)
    # Генерируем статическую заглушку для динамических библиотек
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS true)

    # Включаем высокий уровень предупреждений
    if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
        string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    endif()
endif()

add_library(lab3 SHARED "include/lab3.h" "src/lab3_easy.cc" )
target_include_directories(lab3 PUBLIC "include")



add_executable(n_1 "src/lab_1_1.cc")
add_executable(n_2 "src/lab_1_2.cc")
add_executable(n_3 "src/lab3_easy.cc" "include/lab3.h")

target_link_libraries(n_3 PUBLIC lab3)