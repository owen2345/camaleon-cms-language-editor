jQuery(function(){
    $.fn.extend({
        treed: function (openedClass, closedClass, onChange) {
            var openedClass = openedClass || 'glyphicon-minus-sign';
            var closedClass = closedClass || 'glyphicon-plus-sign';

            //initialize each of the top levels
            var tree = $(this);
            tree.addClass("tree");
            tree.on('click', 'li.branch', function (e, skip_recursive) {
                if (this == e.target) {
                    var icon = $(this).children('i:first');
                    icon.toggleClass(openedClass + " " + closedClass);
                    $(this).children().children().toggle();
                    if(onChange && !skip_recursive) onChange($(this))
                }
                e.stopPropagation();
            });

            tree.on('click', '.branch .indicator', function(){ $(this).closest('li').click(); });
        }
    });

    var panel = $('#translations_editor_table')
    $('#translations_editor_form .mode_copy').click(function(){
        var btn = $(this);
        var edit_mode = btn.hasClass('is_edit_mode');
        if(edit_mode) btn.removeClass('is_edit_mode');
        else btn.addClass('is_edit_mode');
        panel.find('input').each(function(){
            if(edit_mode){
                $(this).show().next().remove();
            }else{
                $(this).hide().after("<span class='input-group-addon copy_mode_label'>\""+$(this).val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '\\\"')+"\"</span>");
            }
        });
    });

    $('#translations_editor_table .translation_column').treed(null, null, function(li, e){
        $('#translations_editor_table li.'+li.attr('data-class')).not(li).trigger('click', [true]);
    });

});