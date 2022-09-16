import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

/**
 * @title wizard
 */
@Component({
  selector: 'star-system-wizard',
  templateUrl: 'star-system-wizard.html',
  styleUrls: ['star-system-wizard.css']
})
export class StarSystemWizard implements OnInit {
  isLinear = false;
  // @ts-ignore 
  firstFormGroup: FormGroup;
  // @ts-ignore 
  secondFormGroup: FormGroup;

  constructor(private _formBuilder: FormBuilder) {}

  ngOnInit() {
    this.firstFormGroup = this._formBuilder.group({
      firstCtrl: ['', Validators.required]
    });
    this.secondFormGroup = this._formBuilder.group({
      secondCtrl: ['', Validators.required]
    });
  }
}