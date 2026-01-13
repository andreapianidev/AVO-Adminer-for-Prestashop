{*
*	The MIT License (MIT)
*
*	Copyright (c) 2015-2017 Emmanuel MARICHAL
*
*	Permission is hereby granted, free of charge, to any person obtaining a copy
*	of this software and associated documentation files (the "Software"), to deal
*	in the Software without restriction, including without limitation the rights
*	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*	copies of the Software, and to permit persons to whom the Software is
*	furnished to do so, subject to the following conditions:
*
*	The above copyright notice and this permission notice shall be included in
*	all copies or substantial portions of the Software.
*
*	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*	THE SOFTWARE.
*}

<script type="riot/tag">
    <ps-panel-footer>
        <div class="panel-footer">
            <yield/>
        </div>

        <style scoped>

            .btn.pull-right {
                margin-left: 5px;
            }
            .btn.pull-left {
                margin-right: 5px;
            }

            a.btn i {
                display: block;
                width: 30px;
                height: 30px;
                margin: 0 auto;
                font-size: 28px;
                background: transparent;
                background-size: 26px;
                background-position: center
            }

        </style>
    </ps-panel-footer>
</script>

<script type="riot/tag">
    <ps-panel-footer-submit>

        <button type="submit" class="btn btn-default pull-{ opts.direction }" name="{ opts.name }" disabled="{ typeof opts.disabled !== 'undefined' }">
            <i class="{ opts.icon }"></i> { opts.title }
        </button>

    </ps-panel-footer-submit>
</script>

<script type="riot/tag">
    <ps-panel-footer-link>

        <a class="btn btn-{ opts.type ? opts.type : 'default' } pull-{ opts.direction }" href="{ opts.href }" target="{ opts.newTab == 'true' ? '_blank' : '' }" onclick="{ opts.onclick }">
            <i class="{ opts.icon }"></i> { opts.title }
        </a>

    </ps-panel-footer-link>
</script>

<script type="riot/tag">
    <ps-panel>

        <div class="panel">

            <div class="panel-heading{ opts.slider == 'true' && !opts.add ? ' slider' : ''}" if={ opts.icon || opts.header }>

                <i class="{ opts.icon }" if={ opts.icon }></i> { opts.header } <span class="slider" if={ opts.slider }>+</span>

                <span class="panel-heading-action" if={ opts.add }>

                        <a class="list-toolbar-btn" href="{ opts.add }">

                            <span data-toggle="tooltip" class="label-tooltip" data-original-title="{ opts.add_title }" data-html="true" data-placement="top" if={ opts.add_title }>

                                <i class="process-icon-new"></i>

                            </span>

                            <i class="process-icon-new" if={ !opts.add_title }></i>

                        </a>

                </span>

            </div>

            <div class="content{ opts.slider == 'true' && !opts.add ? ' slider' : ''}">

                <yield/>

            </div>

            <span class="slider-divider" if={ opts.sliderdivider }>

                <i class="icon-arrow-up"></i> { opts.sliderdivider }

            </span>

        </div>

        <style scoped>

            div.content.slider {
                display: none;
            }

            div.panel-heading.slider span {
                font-size: 2em;
                position: absolute;
                right: .5em;
            }

            div.panel-heading.slider {
                cursor: pointer;
            }

        </style>

    </ps-panel>
</script>

<script type="text/javascript">

    $( document ).ready(function() {
        $("div.slider").on('click', function() {
            content = $( this ).next( ".content" );
            divider = content.next( ".slider-divider" );
            sign = $( this ).find("span.slider");
            arrow = divider.find( "i" );
            if (content.is(":hidden")) {
                content.slideDown();
                arrow.removeClass().addClass("icon-arrow-down");
                divider.fadeOut();
                sign.text('-');

            } else {
                content.slideUp();
                arrow.removeClass().addClass("icon-arrow-up");
                divider.fadeIn();
                sign.text('+');
            }
        });
        return false;
    });

</script>

<script type="riot/tag">
    <ps-panel-divider>

        <hr/>

    </ps-panel-divider>
</script>
