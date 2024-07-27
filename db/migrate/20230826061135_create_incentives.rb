# frozen_string_literal: true

class CreateIncentives < ActiveRecord::Migration[7.0]
  def change
    create_table :incentives do |t|
      t.string :course_type, null: false, comment: "normal、advance、two_ter_normal、two_tier_advance、a_san_self_organization、a_san_other_organization, plus_two_tier_ruby, plus_two_tier_emerald"
      t.string :course_name, null: false, comment: "ノーマル、アドバンス、２ティア(ノーマル)、２ティア(アドバンス)、自組織３段目以降、他系列、ルビー、エメラルド"
      t.integer :incentive_price, null: false, comment: "初期値【100000：スタートアップコース、140000：アドバンス、30000；２ティア(ノーマル)、40000：２ティア（アドバンス）、10000：自組織３段目以降発生、15000：他系列契約時に発生、10000：ルビー、20000：エメラルド】"

      t.timestamps
    end
  end
end
