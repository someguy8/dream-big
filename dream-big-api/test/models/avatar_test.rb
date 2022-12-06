require "test_helper"

class AvatarTest < ActiveSupport::TestCase
  
  test "avatar fixture exists for foreign key" do
    assert_equal 1, avatar(:avatar).id
    assert_equal avatar(:avatar).id, students(:student).id
  end

  test "avatar hair fixture exists for foreign key" do
    assert_equal 1, avatar_hair(:hair).id
    assert_equal avatar_hair(:hair).id, avatar(:avatar).avatar_hairs_id
  end

  test "avatar head fixture exists for foreign key" do
    assert_equal 1, avatar_head(:head).id
    assert_equal avatar_head(:head).id, avatar(:avatar).avatar_head_id
  end

  test "avatar torso fixture exists for foreign key" do
    assert_equal 1, avatar_torso(:torso).id
    assert_equal avatar_torso(:torso).id, avatar(:avatar).avatar_torso_id
  end

  test "avatar accessories fixture exists for foreign key" do
    assert_equal 1, avatar_accesories(:accessory).id
    assert_equal avatar_accessories(:accessory).id, avatar(:avatar).avatar_accessories_id
  end

end