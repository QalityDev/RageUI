(function () {
    'use strict';

    var container = null;
    var current = {
        aimAnim:                'default',
        holsterAnim:            'default',
        weaponMotionOneHanded:  'default',
        weaponMotionTwoHanded:  'default'
    };
    var isVisible = false;

    var AIM_ITEMS = [
        { name: 'Visée par défaut',     value: 'default',      img: 'media/Aim-Default.c4db1adb0171c88f5758.png' },
        { name: 'Visée de gangster',    value: 'GangsterAS',   img: 'media/Aim-Gangster.f9a282eece6fa2f4a267.png' },
        { name: 'Visée de péquenaud',   value: 'HillbillyAS',  img: 'media/Aim-HillBilly.78929c7b42632cd90b9f.png' }
    ];

    var HOLSTER_ITEMS = [
        { name: 'Animation par défaut',  value: 'default',                       img: 'media/Holster-Default.10da11b45b4988b4301f.png' },
        { name: 'Arrière',               value: 'BackHolsterAnimation',          img: 'media/Holster-Back.aef442e6077fc13ccf60.png' },
        { name: 'Flic',                  value: 'SideHolsterAnimation',          img: 'media/Holster-Cop.002868d161f85d88d07e.png' },
        { name: 'Avant',                 value: 'FrontHolsterAnimation',         img: 'media/Holster-Front.b14b654a6baf6eecf38d.png' },
        { name: 'Avant aggressif',       value: 'AgressiveFrontHolsterAnimation',img: 'media/Holster-FrontAgressive.abb1475bb613d9363770.png' },
        { name: 'Jambe',                 value: 'SideLegHolsterAnimation',       img: 'media/Holster-Leg.ac3e1843e81f567c24f5.png' }
    ];

    var ONEHAND_ITEMS = [
        { name: 'Animation par défaut', value: 'default',                              img: 'https://img.flashfa.fr/file/eki/63cb3ec1-3df0-4d0e-81ea-3fe0df85370d.png' },
        { name: 'Long du corps',        value: 'move_ped_wpn_jerrycan_generic',        img: 'https://img.flashfa.fr/file/eki/edae5b0f-d21a-4fd7-8c78-80c68da1bcce.png' },
        { name: 'Franklin',             value: 'move_action@p_m_one@armed@1h@upper',   img: 'https://img.flashfa.fr/file/eki/970b1570-2dec-4ed7-874f-103797930d57.png' },
        { name: 'Michael',              value: 'move_action@p_m_zero@armed@1h@upper',  img: 'https://img.flashfa.fr/file/eki/732407e5-4cdc-4470-b75b-99ea78d6d447.png' }
    ];

    var TWOHAND_ITEMS = [
        { name: 'Animation par défaut', value: 'default',                              img: 'https://img.flashfa.fr/file/eki/cf20dc9c-bc9d-43d1-87ec-aa2d974aa139.png' },
        { name: 'Garde prison',         value: 'move_m@prison_gaurd',                  img: 'https://img.flashfa.fr/file/eki/2f3f4499-4652-4238-85f7-8cd07a36a1b4.png' },
        { name: 'Michael',              value: 'move_action@p_m_zero@armed@2h@upper',  img: 'https://img.flashfa.fr/file/eki/7b181f2c-e12f-41c4-bdf8-e0e41c2a2e09.png' },
        { name: 'Franklin',             value: 'move_action@p_m_one@armed@2h@upper',   img: 'https://img.flashfa.fr/file/eki/99bbfbe4-9dbb-4772-8b0d-9d89a1d825e8.png' },
        { name: 'Trevor',               value: 'move_action@p_m_two@armed@2h@upper',   img: 'https://img.flashfa.fr/file/eki/8492ab86-752e-404a-a550-b877cc380cda.png' },
        { name: 'Loin du corps',        value: 'move_ballistic_2h',                    img: 'https://img.flashfa.fr/file/eki/4c3d2480-5ed6-4bc2-8b25-c0e4cfe24e3d.png' }
    ];

    function post(name, data) {
        fetch('https://ui_lib/' + name, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data || {})
        }).catch(function () {});
    }

    function renderItem(item, selected, vip, onClick) {
        var div = document.createElement('div');
        div.className = 'item' + (selected ? ' selected' : '') + (vip ? ' vip' : '');
        div.innerHTML = '<div class="name">' + item.name + '</div>' +
                        '<img class="item-img" src="' + item.img + '" alt="' + item.name + '" draggable="false" />';
        div.addEventListener('click', onClick);
        return div;
    }

    function renderSection(overlay, title, items, type, vip) {
        var h = document.createElement('h1');
        h.className = 'title';
        h.textContent = title;
        overlay.appendChild(h);

        var grid = document.createElement('div');
        grid.className = 'item-grid';
        items.forEach(function (item) {
            grid.appendChild(renderItem(item, current[type] === item.value, vip, function () {
                current[type] = item.value;
                post('WeaponAnimation:select', { type: type, value: item.value });
                render();
            }));
        });
        overlay.appendChild(grid);
    }

    function render() {
        if (!container) return;
        if (!isVisible) {
            container.style.display = 'none';
            return;
        }
        container.style.display = 'flex';
        container.innerHTML = '';

        var overlay = document.createElement('div');
        overlay.className = 'overlay';

        renderSection(overlay, "Animation : Visée de l'arme",     AIM_ITEMS,     'aimAnim',                false);
        renderSection(overlay, 'Animation : Sortir son arme',     HOLSTER_ITEMS, 'holsterAnim',            false);
        renderSection(overlay, 'Animation : Tenir à une main',    ONEHAND_ITEMS, 'weaponMotionOneHanded',  true);
        renderSection(overlay, 'Animation : Tenir à deux mains',  TWOHAND_ITEMS, 'weaponMotionTwoHanded',  true);

        container.appendChild(overlay);
    }
    container = document.createElement('div');
    container.className = 'weapon-animation';
    container.style.display = 'none';
    document.body.appendChild(container);
    document.addEventListener('keydown', function (e) {
        if (!isVisible) return;
        if (e.key === 'Escape' || e.key === 'Backspace') {
            e.preventDefault();
            post('WeaponAnimation:close');
        }
    });
    window.addEventListener('message', function (event) {
        var msg = event.data;
        if (!msg || !msg.action) return;

        if (msg.action === 'WeaponAnimation:visibility') {
            var d = msg.data || msg;
            isVisible = !!d.visibility;
            if (isVisible) {
                current.aimAnim               = d.aimAnim               || 'default';
                current.holsterAnim           = d.holsterAnim           || 'default';
                current.weaponMotionOneHanded = d.weaponMotionOneHanded || 'default';
                current.weaponMotionTwoHanded = d.weaponMotionTwoHanded || 'default';
            }
            render();
        }
    });
})();
