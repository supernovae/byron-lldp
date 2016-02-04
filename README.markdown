#### Table of Contents

1. [Overview](#overview)
2. [Module Description - Why LLDP?](#module-description)
3. [Setup - The basics of getting started with lldp](#setup)
    * [What lldp affects](#what-lldp-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with lldp](#beginning-with-lldp)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs & starts lldpd

## Module Description

If you want to be able to do LLDP on your switching gear, this module installs the supported daemons. 

lldpd supports several discovery protocols and is smart enough to select the right protocol on each interface:

* LLDP, of course
* CDP (Cisco)
* EDP (Extreme)
* SONMP (Nortel)
* FDP (Foundry)

It is able to advertise the following TLV:
* System name and description
* Port name and description
* VLAN ID and names
* IPv4/IPv6 management address
* MAC/PHY information
* MDI power (802.3af and 802.3at)
* Link aggregation
* Network policies (LLDP-MED)
* Location (LLDP-MED)
* Inventory (LLDP-MED)

More info on LLDPD: http://vincentbernat.github.io/lldpd/

## Setup

### What lldp affects

* installs native lldpd for Ubuntu/Debian
* Installs OpenSuse RPMS for all Redhat Distros
* Sets LLDPD service to start

### Beginning with lldp

class { '::lldp': }


## Usage

Nothing fancy, it just is a simple file/service module.  You can disable the yum repo by setting the params to false if you want to simply use your own repos with lldpd rpms

## Limitations

I test against Debian & Redhat. PR's for other platforms happily accepted.

## Development

Super simple module built on the awesome Puppet Module Skeleton framework (https://github.com/garethr/puppet-module-skeleton) .  Open a PR if you have anything you would like to add or fork and make it your own

I would like to see modules and the community move to puppet 4 en masse. What can we do to make that happen?
