/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AppCafe;

/**
 *
 * @author Andika Risky Septiawan
 */
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
public class LogAktivitasAdminManajer extends javax.swing.JFrame {
    String sql;
    Connection conn;
    Statement stm;
    ResultSet rs;
    PreparedStatement pst;

    /**
     * Creates new form LogAktivitasAdminManajer
     */
    public LogAktivitasAdminManajer() throws SQLException {
        initComponents();
        
        Koneksi DB = new Koneksi();
        DB.config();
        conn = DB.conn;
        stm = DB.stm;
        
        load_table();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblLogAktivitas = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        tbIdAktivitas = new javax.swing.JTextPane();
        jLabel2 = new javax.swing.JLabel();
        btnHapusAktivitas = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Snap ITC", 2, 24)); // NOI18N
        jLabel1.setText("Log Aktivitas Pegawai Cafe Bisa Ngopi");

        tblLogAktivitas.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tblLogAktivitas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblLogAktivitasMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblLogAktivitas);

        tbIdAktivitas.setFont(new java.awt.Font("Tempus Sans ITC", 3, 14)); // NOI18N
        tbIdAktivitas.setEnabled(false);
        jScrollPane2.setViewportView(tbIdAktivitas);

        jLabel2.setFont(new java.awt.Font("Tempus Sans ITC", 3, 14)); // NOI18N
        jLabel2.setText("Id Aktivitas");

        btnHapusAktivitas.setFont(new java.awt.Font("Tempus Sans ITC", 3, 14)); // NOI18N
        btnHapusAktivitas.setText("Hapus Aktivitas");
        btnHapusAktivitas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                btnHapusAktivitasMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(btnHapusAktivitas)))
                        .addGap(0, 121, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(btnHapusAktivitas))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 227, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblLogAktivitasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblLogAktivitasMouseClicked
        // TODO add your handling code here:
        int baris = tblLogAktivitas.rowAtPoint(evt.getPoint());
        
        String id_log = tblLogAktivitas.getValueAt(baris, 1).toString();
        
        tbIdAktivitas.setText(id_log);
    }//GEN-LAST:event_tblLogAktivitasMouseClicked

    private void btnHapusAktivitasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_btnHapusAktivitasMouseClicked
        // TODO add your handling code here:
        String id_log = tbIdAktivitas.getText();
        
        if (id_log.equals("")) {
            JOptionPane.showMessageDialog(null, "Pilih Log yang akan dihapus terlebih dahulu");
        } else {
            try {
                sql = "DELETE FROM log_aktivitas WHERE id_log =" + id_log;
                pst = conn.prepareStatement(sql);
                pst.execute();
                load_table();
                JOptionPane.showMessageDialog(null, "Data berhasil dihapus");
            } catch (Exception e) {
            }
        }
    }//GEN-LAST:event_btnHapusAktivitasMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(LogAktivitasAdminManajer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(LogAktivitasAdminManajer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(LogAktivitasAdminManajer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(LogAktivitasAdminManajer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new LogAktivitasAdminManajer().setVisible(true);
                } catch (SQLException ex) {
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnHapusAktivitas;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextPane tbIdAktivitas;
    private javax.swing.JTable tblLogAktivitas;
    // End of variables declaration//GEN-END:variables

    private void load_table() throws SQLException {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("No.");
        model.addColumn("Id Log Aktv");
        model.addColumn("Id User");
        model.addColumn("Nama User");
        model.addColumn("Tanggal Waktu");
        model.addColumn("Status");
        
        
        try {
            sql = "SELECT * FROM log_aktivitas INNER JOIN user ON log_aktivitas.id_user = user.id_user";
            rs = stm.executeQuery(sql);
            int no = 1;
            while (rs.next()) {                
                model.addRow(new Object[] {no++, rs.getString("id_log"), rs.getString("id_user"), rs.getString("nama_user"), 
                    rs.getString("tgl_wkt"), rs.getString("status")});
            }
        } catch (Exception e) {
        }
        
        tblLogAktivitas.setModel(model);
    }
}
