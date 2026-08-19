window.addEventListener('message', function(event) {
    const item = event.data;
    if (!item) return;

    const container = document.getElementById('rageui-container');
    const titleEl = document.getElementById('rageui-title');
    const subtitleEl = document.getElementById('rageui-subtitle');
    const counterEl = document.getElementById('rageui-counter');
    const itemsEl = document.getElementById('rageui-items');
    const footerEl = document.getElementById('rageui-footer');
    const descriptionEl = document.getElementById('rageui-description');

    if (item.type === 'open_menu') {
        container.style.display = 'block';
        titleEl.textContent = item.data.title || 'RageUI';
        subtitleEl.textContent = item.data.subtitle || 'MENU';
    } 
    else if (item.type === 'render_menu') {
        container.style.display = 'block';
        titleEl.textContent = item.data.title || 'RageUI';
        subtitleEl.textContent = item.data.subtitle || 'MENU';
        counterEl.textContent = `${item.data.index || 1}/${item.data.total || 1}`;

        itemsEl.innerHTML = '';
        let currentDescription = '';

        if (item.data.items && Array.isArray(item.data.items)) {
            item.data.items.forEach((menuItem, i) => {
                const isSelected = menuItem.selected;
                if (isSelected && menuItem.description) {
                    currentDescription = menuItem.description;
                }

                if (menuItem.type === 'separator') {
                    const sepDiv = document.createElement('div');
                    sepDiv.className = 'rageui-separator';
                    sepDiv.textContent = menuItem.label;
                    itemsEl.appendChild(sepDiv);
                    return;
                }

                const itemDiv = document.createElement('div');
                itemDiv.className = `rageui-item ${isSelected ? 'selected' : ''} ${menuItem.disabled ? 'disabled' : ''}`;

                const leftDiv = document.createElement('div');
                leftDiv.className = 'rageui-item-left';
                leftDiv.textContent = menuItem.label;

                const rightDiv = document.createElement('div');
                rightDiv.className = 'rageui-item-right';

                if (menuItem.type === 'checkbox') {
                    const box = document.createElement('div');
                    box.className = `rageui-checkbox-box ${menuItem.checked ? 'checked' : ''}`;
                    rightDiv.appendChild(box);
                } else if (menuItem.type === 'list') {
                    rightDiv.textContent = `< ${menuItem.value || ''} >`;
                } else if (menuItem.rightLabel) {
                    rightDiv.textContent = menuItem.rightLabel;
                } else if (menuItem.rightBadge) {
                    rightDiv.textContent = menuItem.rightBadge;
                }

                itemDiv.appendChild(leftDiv);
                itemDiv.appendChild(rightDiv);
                itemsEl.appendChild(itemDiv);

                if (isSelected) {
                    itemDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                }
            });
        }

        if (currentDescription && currentDescription.trim() !== '') {
            footerEl.style.display = 'block';
            descriptionEl.textContent = currentDescription;
        } else {
            footerEl.style.display = 'none';
        }
    } 
    else if (item.type === 'close_menu') {
        container.style.display = 'none';
    }
});
