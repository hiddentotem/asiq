<?php defined('BASEPATH') or exit('No direct script access allowed');

class Admin_model extends CI_Model
{
    public function getAllMenu($status)
    {
        if($status != 2) {

            return $this->db->get_where('menu', ['menu_status' => $status])->result_array();
        } else {
            
            return $this->db->get('menu')->result_array();
        }
    }
    
    public function getAllSubmenu($status)
    {
        if($status != 2) {

            $sql = "SELECT * FROM submenu s JOIN menu m USING(menu_id) WHERE s.submenu_status = {$status}";
        } else {
            
            $sql = "SELECT * FROM submenu s JOIN menu m USING(menu_id)";
        }
        
        return $this->db->query($sql)->result_array();
    }

    public function getMenuById($id)
    {
        return $this->db->get_where('menu', ['menu_id' => $id])->row_array();
    }

    public function getSubmenuById($id)
    {
        return $this->db->get_where('submenu', ['submenu_id' => $id])->row_array();
    }

    public function menuAdd($data)
    {
        $this->db->insert('menu', $data);
    }

    public function menuUpdate($data, $id)
    {
        $this->db->where('menu_id', $id);
        $this->db->update('menu', $data);
    }

    public function submenuAdd($data)
    {
        $this->db->insert('submenu', $data);
    }

    public function submenuUpdate($data, $id)
    {
        $this->db->where('submenu_id', $id);
        $this->db->update('submenu', $data);
    }

    public function getAllRole()
    {
        return $this->db->get('role')->result_array();
    }

    public function getRoleById($id)
    {
        return $this->db->get_where('role', ['role_id' => $id])->row_array();
    }

    public function roleAdd($data)
    {
        $this->db->insert('role', $data);
    }

    public function roleUpdate($data, $id)
    {
        $this->db->where('role_id', $id);
        $this->db->update('role', $data);
    }

    public function getAccess($data)
    {
        return $this->db->get_where('menu_akses', $data)->num_rows();
    }

    public function setAccess($data)
    {
        $this->db->insert('menu_akses', $data);
    }
    
    public function dropAccess($data)
    {
        $this->db->delete('menu_akses', $data);
    }
}