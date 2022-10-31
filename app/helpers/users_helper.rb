module UsersHelper
  
  
    def subuser(user)
        ret=  "  
        <p>
        <table>
        <thead>
            <tr>
            <th>Rua</th>
            <th>Nº</th> 
            <th>Bairro</th>
            <th>CEP</th>
            <th>Cidade</th>
            </tr>
        </thead>

        <tbody> "
            user.addresses.each do |address| 
            ret << " <tr>
            <td>#{ address.street }</td>
                <td>#{ address.number }</td>
                <td>#{ address.district }</td>
                <td>#{address.zipcode }</td>
                <td>#{ address.city }</td>
                <td>#{ link_to 'Show', address }</td>
                <td>#{ link_to 'Edit', edit_address_path(address) }</td>
                <td>#{ link_to 'Destroy', address, method: :delete, data: { confirm: 'Are you sure?' } }</td>
            </tr> "
            end
        ret << "</tbody>
        </table>
        </p>
       "
       ret.html_safe
    end

end
