//
//  AddRegistraitionTableViewController.swift
//  HotelManzana
//
//  Created by ALI MOOSA on 05/12/2022.
//

import UIKit

class AddRegistraitionTableViewController: UITableViewController, SelectRoom_TypeTableViewControllerDelegate {
    
    var registeration: Registration?{
        guard let roomType = roomType else{return nil}
        let firstName = firstNameTextField.text ?? ""
        let lastname = lastNameTextFeild.text ?? ""
        let email = emailTextField.text ?? ""
        
        let chekInDate = checInDatePicker.date
        let checkOut = checkOutDatePicker.date
        let NumberOfAdults = Int( numberOfAdultsStepper.value)
        let NumberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWiFi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastname, emailAddress: email, checkInDate: chekInDate, CheckOutDate: checkOut, numberOfAdults: NumberOfAdults, numberOfChildren: NumberOfChildren, Wifi: hasWiFi, roomType: roomType)
    }
    
    
    
    
    // MARK: -

    func SelectRoom_TypeTableViewController(_ controller: SelectRoom_TypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
    
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoom_TypeTableViewController? {
        
        let selectRoomTypeController = HotelManzana.SelectRoom_TypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        
        
        return selectRoomTypeController
    }
    
    
    
    var roomType : RoomType?

    @IBOutlet weak var roomTypeLabel: UILabel!
    func updateRoomType(){
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        }else{
            roomTypeLabel.text = "  NOT SET  "
        }
    }
    
    
    
    // MARK: -
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
        
        //finish later
    }
    
    
    
    
    
    
    // MARK: -
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    
    
    func updateNumberOfGuests(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    
    
    // MARK: -
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInDateLableCellIndexPath = IndexPath(row: 0, section: 1)
    
    let checkOutDateLableCellIndexPath = IndexPath(row: 2, section: 1)
    
   
    
    
    
    var isCkeckInDatePickerVisible : Bool = false{
    didSet{
        checInDatePicker.isHidden = !isCkeckInDatePickerVisible
        
    }
    
    }
    
    
    var isCkeckOutDatePickerVisible : Bool = false{
    didSet{
        checInDatePicker.isHidden = !isCkeckOutDatePickerVisible
        
    }
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
            
            
        case checkInDatePickerCellIndexPath where isCkeckInDatePickerVisible == false :
            return 0
            
            
            
        case checkOutDatePickerCellIndexPath where isCkeckOutDatePickerVisible == false :
            return 0
            
            
            
        default :
            return UITableView.automaticDimension
            
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
            
        case checkInDatePickerCellIndexPath :
            return 190
            
        case checkOutDatePickerCellIndexPath :
            return 190
            
        default:
            return UITableView.automaticDimension
            
            
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if indexPath == checkInDateLableCellIndexPath && isCkeckOutDatePickerVisible == false {
            // Check In lablel selected , check out picker is not visible, toggle checkout picker
            isCkeckInDatePickerVisible.toggle()
            
       }else if indexPath == checkOutDateLableCellIndexPath && isCkeckInDatePickerVisible == false {
            // Check-Out lablel selected , check-In picker is not visible, toggle checkout picker
            isCkeckOutDatePickerVisible.toggle()
            
        }else if  indexPath == checkInDateLableCellIndexPath ||
                    indexPath == checkOutDatePickerCellIndexPath {
            // eather lable was selected , previos conditions failed meaning at least one picker is visable, toggle both
            
            isCkeckInDatePickerVisible.toggle()
            isCkeckOutDatePickerVisible.toggle()
        }else{
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        
            
            
        }
        
        
        
        
    
    
    
    
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextFeild: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    /*
    @IBAction func DoneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstname = firstNameTextField.text ?? ""
        let lastName = lastNameTextFeild.text ?? ""
        let email = emailTextField.text ?? ""
        let phoneNumber = phoneNumberTextField.text ?? ""
        let checkIndate = checInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        let roomChoice = roomType?.name ?? "Not Set"
        
        
        print("DONE TAPPED")
        print("firstname: \(firstname)")
        print("lastName: \(lastName)")
        print("email: \(email)")
        print("phone number: \(phoneNumber) ")
        print("check In Date \(checkIndate)")
        print("Check Out Date \(checkOutDate)")
        print("numberOfAdults \(numberOfAdults)")
        print("numberOfChildren \(numberOfChildren)")
        print("wifi\(hasWifi)")
        print ("Room Choice \(roomChoice)")
    }
    */
    // MARK: -
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    
    @IBOutlet weak var checInDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    // MARK: -
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    
    
    
    
    
    // MARK: -
    func updateDateViews(){
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1 , to: checInDatePicker.date)
        
        
        
        checkInDateLabel.text = checInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        let midNightToday = Calendar.current.startOfDay(for: Date())
        checInDatePicker.minimumDate = midNightToday
        checInDatePicker.date = midNightToday

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
 */

  //  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
  //     return
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
