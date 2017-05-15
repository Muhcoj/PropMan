# Property management app

Key requirements: Company wants to infomr users of their monthly house payments and posts for upcomming meetings or news. 

## Models:
- Post -> 
x Finance -> year:string month:string payment_due:decimal
x User -> Devise
x AdminUser -> STI User

## Features:
- Monthly Billing overview
x Administrate admin dashboard
- Email Billing information to User
- Meetings Calendar simple_calendar
- Upload files via carrierwave/AWS
- Make Homepage visible for everyone

## UI:
x Bootstrap -> Formatting
- Icons from Font Awesome
x Update the styles for forms
- Style Homepage

## Refactor TODOS
- Refactor finance association integration test in finance_spec
