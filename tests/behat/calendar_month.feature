# This file is part of Moodle - http://moodle.org/
#
# Moodle is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Moodle is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Moodle.  If not, see <http://www.gnu.org/licenses/>.
#
#
# @package    theme_snap
# @copyright Copyright (c) 2015 Moodlerooms Inc. (http://www.moodlerooms.com)
# @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

@theme @theme_snap
Feature: When a user clicks on next or previous month link in the calendar block, then
  the page redirects and the calendar block must be visible.

  Background:
    Given the following config values are set as admin:
      | theme | snap |
    And the following "courses" exist:
      | fullname               | shortname     | category | groupmode | format         |
      | Course 1               | course_topics | 0        | 1         | topics         |
    And the following "users" exist:
      | username | firstname | lastname | email                |
      | teacher1 | Teacher   | 1        | teacher1@example.com |
    And the following "course enrolments" exist:
      | user     | course        | role           |
      | teacher1 | course_topics | editingteacher |


  @javascript
  Scenario: Ensure that on the redirection the calendar is being display on the page when a user clicks on the next month link
    or in the previous month link
  Given I log in as "teacher1" (theme_snap)
   Then I open the personal menu
    And I follow "Course 1"
   Then I follow "Course Tools"
    And I follow "Edit course blocks"
   Then I add the "Calendar" block
    And I turn editing mode off
   Then I follow "Course Tools"
    And I should see "Calendar"
    And I follow "Next month"
   Then I should see "Calendar"

  @javascript
  Scenario: Ensure that on the redirection the calendar is being display on the page when a user clicks on the previous month link
    or in the previous month link
  Given I log in as "teacher1" (theme_snap)
   Then I open the personal menu
    And I follow "Course 1"
   Then I follow "Course Tools"
    And I follow "Edit course blocks"
   Then I add the "Calendar" block
    And I turn editing mode off
   Then I follow "Course Tools"
    And I should see "Calendar"
    And I follow "Previous month"
   Then I should see "Calendar"
