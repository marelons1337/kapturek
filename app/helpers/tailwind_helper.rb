# frozen_string_literal: true

module TailwindHelper
  def input_class
    "block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none
       focus:outline-none focus:bg-gray-300 focus:shadow-inner"
  end

  def label_class
    "block text-xs font-semibold text-gray-600 uppercase mt-2"
  end

  def large_form_button_class
    "w-full py-3 mt-6 font-medium tracking-widest text-white uppercase bg-indigo-700 hover:bg-indigo-600
    focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-600 rounded cursor-pointer"
  end

  def index_active_tab_class
    "py-2 px-8 bg-indigo-100 text-indigo-700 rounded-full"
  end

  def index_inactive_tab_class
    "py-2 px-8 text-gray-600 hover:text-indigo-700 hover:bg-indigo-100 rounded-full"
  end

  def success_text_color
    "text-green-600"
  end

  def error_text_color
    "text-red-600"
  end
end
