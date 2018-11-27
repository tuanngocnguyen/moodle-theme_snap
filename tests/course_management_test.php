<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Course management tests for Snap.
 *
 * @package   theme_snap
 * @copyright Copyright (c) 2018 Blackboard Inc. (http://www.blackboard.com)
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die();

/**
 * Course management renderer tests for Snap.
 *
 * @package   theme_snap
 * @copyright Copyright (c) 2018 Blackboard Inc. (http://www.blackboard.com)
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class theme_snap_course_management_test extends advanced_testcase {
    public function test_link_updated_with_hash() {
        global $PAGE, $CFG;

        $this->resetAfterTest(true);

        $generator = $this->getDataGenerator();
        $catrecord = $generator->create_category();

        $CFG->theme = 'snap';
        $PAGE->set_url('/course/management.php', ['categoryid' => $catrecord->id]);
        $renderer = $PAGE->get_renderer('core_course', 'management');

        $rendercategory = coursecat::get($catrecord->id);
        $courserecord = $generator->create_course([
            'category' => $catrecord->id
        ]);
        $rendercourse = new course_in_list($courserecord);

        $html = $renderer->course_listitem($rendercategory, $rendercourse, $courserecord->id);
        $url = '/course/management.php?categoryid='.$catrecord->id.'&amp;courseid='.$courserecord->id.'#course-detail-title';
        $this->assertContains($url, $html);
    }
}
