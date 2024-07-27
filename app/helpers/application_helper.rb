# frozen_string_literal: true

module ApplicationHelper
  require "date"

  def get_current_path
    request.fullpath
  end

  def page_year_month_include? page, year, month
    if page.present? && year && month
      true
    else
      false
    end
  end

  # 誕生日から年齢を取得
  def calculate_age birthdate
    # 現在の日付を取得
    today = Time.zone.today

    # 現在の年 - 生年月日の年
    age = today.year - birthdate.year

    # 今年の誕生日をまだ迎えていなければ、年齢から1を引く
    age -= 1 if today < birthdate + age.years

    age
  end

  def get_title_color user
    case user&.grade_id
    when 99
      "not_title"
    when 1
      "normal"
    when 2
      "ruby"
    when 3
      "emerald"
    else
      "none"
    end
  end

  def image_url_for user
    return nil unless user.user_image.attached?

    rails_blob_url(user.user_image, only_path: true)
  end

  def get_course_name course_id
    case course_id.to_i
    when 1
      "スタートアップコース"
    when 2
      "ベーシックコース"
    when 3
      "エグゼクティブコース"
    end
  end
end
