module ProceduresHelper
  def new_fields_template(f,association,options={})
    options[:object] ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize+"_fields"
    options[:template] ||= association.to_s+"_fields"
    options[:f] ||= :f

    tmpl = content_tag(:div,:id =>"#{options[:template]}") do
      tmpl = f.fields_for(association,options[:object], :child_index => "new_#{association}") do |b|
        render(:partial=>options[:partial],:locals =>{:f => b})
      end
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ' '
    return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
  end

  def add_child_button(name, association,target)
    content_tag(:spam,"<span>#{name}</span>".html_safe,
      :class => "add_child",
      :style => "cursor:pointer; display: inline-block;  width: 16;",
      :"data-association" => association,
      :target => target)
  end

  def remove_child_button(name)
    content_tag(:div,"<span> Eliminar </span>".html_safe,
      :style => "cursor:pointer; border:1px solid #777; display:inline-block; width: 60px;",
      :class => "remove_child")
  end

  def documents_required(user, procedure)
    excluded = [] #Array con los documetos que excluira 
    user_docs = user.documents.where(code: %w[CI RIF]) #Excluye estos documentos si ya el usuario los tiene cargados
    
    user_docs.each do |doc|
      excluded << doc.code    
    end
    
    procedure_documents = DocumentMaster.where(procedure: procedure.name, active: true, initially_required: true)
                          .where.not(code: excluded)
    return procedure_documents
  end  

end
