<?php
defined('BASEPATH') or exit('No direct script access allowed');

// Controller user yang mengelola user page
class User extends CI_Controller
{
    public function __construct()
    {
        // Extends ke construct parentnya
        parent::__construct();

        // Memanggil helper checkLogin
        checkLogin();

        // Memanggil model User_model
        $this->load->model('User_model', 'user');
    }

    public function index()
    {
        // mencari data user berdasarkan email yang dikirim oleh session
        $email = $this->session->userdata('email');
        $data['user'] = $this->db->get_where('users', ['user_email' => $email])->row_array();

        $data['title'] = 'Profile';

        $this->load->view('templates/header', $data); // Mengirimkan data user dan title
        $this->load->view('templates/sidebar', $data); // Mengirimkan data user
        $this->load->view('templates/topbar', $data); // Mengirimkan data user
        $this->load->view('user/index', $data); // Mengirimkan data user
        $this->load->view('templates/footer');
    }

    public function editProfile()
    {
        $name = $this->input->post('name', true);
        $email = $this->input->post('email', true);
        $user = $this->db->get_where('users', ['user_email' => $email])->row_array();
        
        $this->form_validation->set_rules('name', 'Name', 'required|trim');

        if($this->form_validation->run() == FALSE) {
            $this->session->set_flashdata('failupdate', 'profile');
            redirect('user');
        } else {
            $uploadImage = $_FILES['image']['name'];

            if($uploadImage) {
                $config['allowed_types'] = 'gif|jpg|jpeg|png'; 
                $config['max_size']     = '2048'; 
                $config['upload_path'] = './assets/img/profile/';

                $this->load->library('upload', $config);

                if ($this->upload->do_upload('image')) {
                    $oldImage = $user['user_image'];

                    if($oldImage != 'default.jpg') {
                        unlink(FCPATH . 'assets/img/profile' . $oldImage);
                    }

                    $newImage = $this->upload->data('file_name');
                    $this->user->editProfileWithImage($name, $email, $newImage);
                    
                    $this->session->set_flashdata('succupdate', 'profile');
                    redirect('user');
                } else {
                    $this->session->set_flashdata('failupdate', 'image');
                    redirect('user');
                }
            } else {
                
                $this->user->editProfile($name, $email);
                
                $this->session->set_flashdata('succupdate', 'profile');
                redirect('user');
            }

        }
    }

    public function ajaxChangePassword()
    {
        $this->form_validation->set_rules('oldPassword', 'Current Password', 'required|trim');
        $this->form_validation->set_rules('password1', 'New Password', 'required|trim|min_length[3]|matches[password2]');
        $this->form_validation->set_rules('password2', 'Repeat New Password', 'required|trim|min_length[3]|matches[password1]');

        if($this->form_validation->run() == FALSE) {
            $formEror = [
                'oldPassword' => form_error('oldPassword', '<small class="text-danger pl-3">', '</small>'),
                'password1' => form_error('password1', '<small class="text-danger pl-3">', '</small>'),
                'password2' => form_error('password2', '<small class="text-danger pl-3">', '</small>'),
            ];

            $result = [
                'result' => false,
                'error' => $formEror
            ];

            echo json_encode($result);
        } else {
            $oldPassword = $this->input->post('oldPassword', true);
            $password1 = $this->input->post('password1', true);
            $password2 = $this->input->post('password2', true);
            $email = $this->session->userdata('email');
            $user = $this->db->get_where('users', ['user_email' => $email])->row_array();

            if(!password_verify($oldPassword, $user['user_password'])) {
                $formEror = [
                    'alert' => 'Your current password is wrong.',
                    'notif' => 'Oops, change password failed!'
                ];

                $result = [
                    'result' => 2,
                    'error' => $formEror
                ];

                echo json_encode($result);
            } else {
                if($oldPassword == $password1) {
                    $formEror = [
                        'alert' => 'New password cannot be the same as current password.',
                        'notif' => 'Oops, change password failed!'
                    ];

                    $result = [
                        'result' => 2,
                        'error' => $formEror
                    ];

                    echo json_encode($result);
                } else {
                    $hash = password_hash($password1, PASSWORD_DEFAULT);
                    
                    $data = [
                        'user_password' => $hash,
                        'dateModified' => Date('Y-m-d H:i:s')
                    ];
                    
                    $this->user->updatePassword($data, $email);

                    $result = [
                        'result' => true,
                        'error' => ''
                    ];
                    
                    echo json_encode($result);
                }
            }
        }

    }
}