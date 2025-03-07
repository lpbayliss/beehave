# GdUnit generated TestSuite
class_name InverterTest
extends GdUnitTestSuite
@warning_ignore("unused_parameter")
@warning_ignore("return_value_discarded")


# TestSuite generated from
const __source = "res://addons/beehave/nodes/decorators/inverter.gd"
const __action = "res://test/actions/count_up_action.gd"
const __tree = "res://addons/beehave/nodes/beehave_tree.gd"
const __blackboard = "res://addons/beehave/blackboard.gd"

var tree: BeehaveTree
var action: ActionLeaf


func before_test() -> void:
	tree = auto_free(load(__tree).new())
	action = auto_free(load(__action).new())
	var inverter = auto_free(load(__source).new())
	
	var actor = auto_free(Node2D.new())
	var blackboard = auto_free(load(__blackboard).new())
	
	tree.add_child(inverter)
	inverter.add_child(action)
	
	tree.actor = actor
	tree.blackboard = blackboard


func test_invert_success_to_failure() -> void:
	action.status = BeehaveNode.SUCCESS
	assert_that(tree.tick()).is_equal(BeehaveNode.FAILURE)


func test_invert_failure_to_success() -> void:
	action.status = BeehaveNode.FAILURE
	assert_that(tree.tick()).is_equal(BeehaveNode.SUCCESS)
