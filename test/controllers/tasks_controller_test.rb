require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get :index, params: { category_id: @category }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { category_id: @category }
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, params: { category_id: @category, task: @task.attributes }
    end

    assert_redirected_to category_task_path(@category, Task.last)
  end

  test "should show task" do
    get :show, params: { category_id: @category, id: @task }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { category_id: @category, id: @task }
    assert_response :success
  end

  test "should update task" do
    put :update, params: { category_id: @category, id: @task, task: @task.attributes }
    assert_redirected_to category_task_path(@category, Task.last)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, params: { category_id: @category, id: @task }
    end

    assert_redirected_to category_tasks_path(@category)
  end
end
