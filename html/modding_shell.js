/* Modding shell v2 (AVA-parity) — registre complet 18 outils, multi-fenêtres, gating API, blueprint. */
(function () {
    'use strict';

    var RESOURCE = typeof GetParentResourceName === 'function' ? GetParentResourceName() : 'ui_lib';

    function nui(name, data) {
        return fetch('https://' + RESOURCE + '/' + name, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=UTF-8' },
            body: JSON.stringify(data || {})
        }).then(function (r) { return r.json().catch(function () { return {}; }); }).catch(function () { return {}; });
    }

    var ICONS = {
        home: ['0 0 576 512', 'M280.37 148.26L96 300.11V464a16 16 0 0 0 16 16l112.06-.29a16 16 0 0 0 15.92-16V368a16 16 0 0 1 16-16h64a16 16 0 0 1 16 16v95.64a16 16 0 0 0 16 16.05L464 480a16 16 0 0 0 16-16V300L295.67 148.26a12.19 12.19 0 0 0-15.3 0zM571.6 251.47L488 182.56V44.05a12 12 0 0 0-12-12h-56a12 12 0 0 0-12 12v72.61L318.47 43a48 48 0 0 0-61 0L4.34 251.47a12 12 0 0 0-1.6 16.9l25.5 31A12 12 0 0 0 45.15 301l235.22-193.74a12.19 12.19 0 0 1 15.3 0L530.9 301a12 12 0 0 0 16.9-1.6l25.5-31a12 12 0 0 0-1.7-16.93z'],
        emote: ['0 0 496 512', 'M248 8C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm80 168c17.7 0 32 14.3 32 32s-14.3 32-32 32-32-14.3-32-32 14.3-32 32-32zm-160 0c17.7 0 32 14.3 32 32s-14.3 32-32 32-32-14.3-32-32 14.3-32 32-32zm194.8 170.2C334.3 380.4 292.5 400 248 400s-86.3-19.6-114.8-53.8c-13.6-16.3 11-36.7 24.6-20.5 22.4 26.9 55.2 42.2 90.2 42.2s67.8-15.4 90.2-42.2c13.4-16.2 38.1 4.2 24.6 20.5z'],
        mocap: ['0 0 512 512', 'M336.2 64H48c-26.5 0-48 21.5-48 48v288c0 26.5 21.5 48 48 48h288.2c26.4 0 47.8-21.4 47.8-47.8V111.8c0-26.4-21.4-47.8-47.8-47.8zm189.4 37.7L416 177.3v157.4l109.6 75.5c21.2 14.6 50.4-.3 50.4-25.8V127.5c0-25.4-29.1-40.4-50.4-25.8z'],
        tattoo: ['0 0 512 512', 'M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z'],
        car: ['0 0 512 512', 'M499.99 176h-59.87l-16.64-41.6C406.38 91.63 365.57 64 319.5 64h-127c-46.06 0-86.88 27.63-103.99 70.4L71.87 176H12.01C4.2 176-1.53 183.34.37 190.91l6 24C7.7 220.25 12.5 224 18.01 224h20.07C24.65 235.73 16 252.78 16 272v48c0 16.12 6.16 30.67 16 41.93V416c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32v-32h256v32c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32v-54.07c9.84-11.25 16-25.8 16-41.93v-48c0-19.22-8.65-36.27-22.07-48H494c5.51 0 10.31-3.75 11.64-9.09l6-24c1.89-7.57-3.84-14.91-11.65-14.91zm-352.06-17.83c7.29-18.22 24.94-30.17 44.57-30.17h127c19.63 0 37.28 11.95 44.57 30.17L384 208H128l19.93-49.83zM96 319.8c-19.2 0-32-12.76-32-31.9S76.8 256 96 256s48 28.71 48 47.85-28.8 15.95-48 15.95zm320 0c-19.2 0-48 3.19-48-15.95S396.8 256 416 256s32 12.76 32 31.9-12.8 31.9-32 31.9z'],
        ped: ['0 0 320 512', 'M208 96c26.5 0 48-21.5 48-48S234.5 0 208 0s-48 21.5-48 48 21.5 48 48 48zm94.5 149.1l-23.3-11.8-9.7-29.4c-14.7-44.6-55.7-75.8-102.2-75.9-36-.1-55.9 10.1-93.3 25.2-21.6 8.7-39.3 25.2-49.7 46.2L17.6 213c-7.8 15.8-1.5 35 14.2 42.9 15.6 7.9 34.6 1.5 42.5-14.3L81 228c3.5-7 9.3-12.5 16.5-15.4l26.8-10.8-15.2 60.7c-5.2 20.8.4 42.9 14.9 58.8l59.9 65.4c7.2 7.9 12.3 17.4 14.9 27.7l18.3 73.3c4.3 17.1 21.7 27.6 38.8 23.3 17.1-4.3 27.6-21.7 23.3-38.8l-22.2-89c-2.6-10.3-7.7-19.9-14.9-27.7l-45.5-49.7 17.2-68.7 5.5 16.5c5.3 16.1 16.7 29.4 31.7 37l23.3 11.8c15.6 7.9 34.6 1.5 42.5-14.3 7.7-15.7 1.4-35.1-14.3-43z'],
        mapper: ['0 0 576 512', 'M384 476.1L192 421.2V35.93L384 90.79V476.1zM416 88.37L543.1 37.53C558.9 31.23 576 42.84 576 59.82V394.6C576 404.4 570 413.2 560.9 416.9L416 474.8V88.37zM15.09 95.13L160 37.17V423.6L32.91 474.5C17.15 480.8 0 469.2 0 452.2V117.4C0 107.6 5.975 98.78 15.09 95.13V95.13z'],
        light: ['0 0 352 512', 'M96.06 454.35c.01 6.29 1.87 12.45 5.36 17.69l17.09 25.69a31.99 31.99 0 0 0 26.64 14.28h61.71a31.99 31.99 0 0 0 26.64-14.28l17.09-25.69a31.989 31.989 0 0 0 5.36-17.69l.04-38.35H96.01l.05 38.35zM0 176c0 44.37 16.45 84.85 43.56 115.78 16.52 18.85 42.36 58.23 52.21 91.45.04.26.07.52.11.78h160.24c.04-.26.07-.51.11-.78 9.85-33.22 35.69-72.6 52.21-91.45C335.55 260.85 352 220.37 352 176 352 78.61 272.91-.3 175.45 0 73.44.31 0 82.97 0 176z'],
        audio: ['0 0 480 512', 'M280 0C266.7 0 256 10.7 256 24V488c0 13.3 10.7 24 24 24s24-10.7 24-24V24c0-13.3-10.7-24-24-24zM104 160c-13.3 0-24 10.7-24 24V328c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24zm88-64c-13.3 0-24 10.7-24 24V392c0 13.3 10.7 24 24 24s24-10.7 24-24V120c0-13.3-10.7-24-24-24zM368 96c-13.3 0-24 10.7-24 24V392c0 13.3 10.7 24 24 24s24-10.7 24-24V120c0-13.3-10.7-24-24-24zm88 64c-13.3 0-24 10.7-24 24V328c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24z'],
        door: ['0 0 448 512', 'M320 32H128C92.65 32 64 60.65 64 96v384h64V96h192v384h64V96c0-35.35-28.65-64-64-64zM272 256c-8.8 0-16 7.2-16 16s7.2 16 16 16 16-7.2 16-16-7.2-16-16-16z'],
        eye: ['0 0 576 512', 'M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z'],
        scenarios: ['0 0 640 512', 'M96 224c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm448 0c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm32 32h-64c-17.6 0-33.5 7.1-45.1 18.6 40.3 22.1 68.9 62 75.1 109.4h66c17.7 0 32-14.3 32-32v-32c0-35.3-28.7-64-64-64zm-256 0c61.9 0 112-50.1 112-112S381.9 32 320 32 208 82.1 208 144s50.1 112 112 112zm76.8 32h-8.3c-20.8 10-43.9 16-68.5 16s-47.6-6-68.5-16h-8.3C179.6 288 128 339.6 128 403.2V432c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48v-28.8c0-63.6-51.6-115.2-115.2-115.2z'],
        map: ['0 0 576 512', 'M0 117.66v346.32c0 11.32 11.43 19.06 21.94 14.86L160 416V32L20.12 87.95A32.006 32.006 0 0 0 0 117.66zM192 416l192 64V96L192 32v384zM554.06 33.16L416 96v384l139.88-55.95A31.996 31.996 0 0 0 576 394.34V48.02c0-11.32-11.43-19.06-21.94-14.86z'],
        collision: ['0 0 512 512', 'M239.1 6.3l-208 78c-18.7 7-31.1 25-31.1 45v225.1c0 18.2 10.3 34.8 26.5 42.9l208 104c13.5 6.8 29.4 6.8 42.9 0l208-104c16.3-8.1 26.5-24.8 26.5-42.9V129.3c0-20-12.4-37.9-31.1-44.9l-208-78C262 2.2 250 2.2 239.1 6.3zM256 68.4l192 72v1.1l-192 78-192-78v-1.1l192-72zm32 356V275.5l160-65v133.9l-160 80z'],
        world: ['0 0 496 512', 'M336.5 160C322 70.7 287.8 8 248 8s-74 62.7-88.5 152h177zM152 256c0 22.2 1.2 43.5 3.3 64h185.3c2.1-20.5 3.3-41.8 3.3-64s-1.2-43.5-3.3-64H155.3c-2.1 20.5-3.3 41.8-3.3 64zm324.7-96c-28.6-67.9-86.5-120.4-158-141.6 24.4 33.8 41.2 84.7 50 141.6h108zM177.2 18.4C105.8 39.6 47.8 92.1 19.3 160h108c8.7-56.9 25.5-107.8 49.9-141.6zM487.4 192H372.7c2.1 21 3.3 42.5 3.3 64s-1.2 43-3.3 64h114.6c5.5-20.5 8.6-41.8 8.6-64s-3.1-43.5-8.5-64zM120 256c0-21.5 1.2-43 3.3-64H8.6C3.2 212.5 0 233.8 0 256s3.2 43.5 8.6 64h114.6c-2-21-3.2-42.5-3.2-64zm39.5 96c14.5 89.3 48.7 152 88.5 152s74-62.7 88.5-152h-177zm159.3 141.6c71.4-21.2 129.4-73.7 158-141.6h-108c-8.8 56.9-25.6 107.8-50 141.6zM19.3 352c28.6 67.9 86.5 120.4 158 141.6-24.4-33.8-41.2-84.7-50-141.6h-108z'],
        conflict: ['0 0 512 512', 'M256 32C114.6 32 0 125.1 0 240c0 47.6 19.9 91.2 52.9 126.3C38 405.7 7 439.1 6.5 439.5c-6.6 7-8.4 17.2-4.6 26S14.4 480 24 480c61.5 0 110-25.7 139.1-46.3C192 442.8 223.2 448 256 448c141.4 0 256-93.1 256-208S397.4 32 256 32zm0 96c13.3 0 24 10.7 24 24v88c0 13.3-10.7 24-24 24s-24-10.7-24-24v-88c0-13.3 10.7-24 24-24zm0 208c-17.7 0-32-14.3-32-32s14.3-32 32-32 32 14.3 32 32-14.3 32-32 32z'],
        film: ['0 0 512 512', 'M488 64h-8v20c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12V64H96v20c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12V64h-8C10.7 64 0 74.7 0 88v336c0 13.3 10.7 24 24 24h8v-20c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v20h320v-20c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v20h8c13.3 0 24-10.7 24-24V88c0-13.3-10.7-24-24-24zM96 372c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12H44c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm272 208c0 6.6-5.4 12-12 12H156c-6.6 0-12-5.4-12-12v-96c0-6.6 5.4-12 12-12h200c6.6 0 12 5.4 12 12v96zm0-168c0 6.6-5.4 12-12 12H156c-6.6 0-12-5.4-12-12v-96c0-6.6 5.4-12 12-12h200c6.6 0 12 5.4 12 12v96zm112 152c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40zm0-96c0 6.6-5.4 12-12 12h-40c-6.6 0-12-5.4-12-12v-40c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v40z'],
        blueprint: ['0 0 512 512', 'M512 199.652c0 23.625-20.65 43.826-44.8 43.826h-99.851c16.34 17.048 18.346 49.766-6.299 70.944 14.288 22.829 2.147 53.017-16.45 62.315C353.574 425.878 322.654 448 272 448c-2.746 0-13.276-.203-16-.195-61.971.168-76.894-31.065-123.731-38.315C120.596 407.683 112 397.599 112 385.786V214.261l.002-.001c.011-18.366 10.607-35.889 28.464-43.845 28.886-12.994 95.413-49.038 107.534-77.323 7.797-18.194 21.384-29.084 40-29.092 34.222-.014 57.752 35.098 44.119 66.908-3.583 8.359-8.312 16.67-14.153 24.918H467.2c23.45 0 44.8 20.543 44.8 43.826zM96 200v192c0 13.255-10.745 24-24 24H24c-13.255 0-24-10.745-24-24V200c0-13.255 10.745-24 24-24h48c13.255 0 24 10.745 24 24z'],
        layers: ['0 0 512 512', 'M12.41 148.02l232.94 105.67c6.8 3.09 14.49 3.09 21.29 0l232.94-105.67c16.55-7.51 16.55-32.52 0-40.03L266.65 2.31a25.607 25.607 0 0 0-21.29 0L12.41 107.98c-16.55 7.51-16.55 32.53 0 40.04zm487.18 88.28l-58.09-26.33-161.64 73.27c-7.56 3.43-15.59 5.17-23.86 5.17s-16.29-1.74-23.86-5.17L70.51 209.97l-58.1 26.33c-16.55 7.5-16.55 32.5 0 40l232.94 105.59c6.8 3.08 14.49 3.08 21.29 0L499.59 276.3c16.55-7.5 16.55-32.5 0-40zm0 127.8l-57.87-26.23-161.86 73.37c-7.56 3.43-15.59 5.17-23.86 5.17s-16.29-1.74-23.86-5.17L70.29 337.87 12.41 364.1c-16.55 7.5-16.55 32.5 0 40l232.94 105.59c6.8 3.08 14.49 3.08 21.29 0L499.59 404.1c16.55-7.5 16.55-32.5 0-40z'],
        edit: ['0 0 512 512', 'M290.74 93.24l128.02 128.02-277.99 277.99-114.14 12.6C11.35 513.54-1.56 500.62.14 485.34l12.7-114.22 277.9-277.88zm207.2-19.06l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.76 18.75-49.16 0-67.91z'],
        tools: ['0 0 512 512', 'M501.1 395.7L384 278.6c-23.1-23.1-57.6-27.6-85.4-13.9L192 158.1V96L64 0 0 64l96 128h62.1l106.6 106.6c-13.6 27.8-9.2 62.3 13.9 85.4l117.1 117.1c14.6 14.6 38.2 14.6 52.7 0l52.7-52.7c14.5-14.6 14.5-38.2 0-52.7zM331.7 225c28.3 0 54.9 11 74.9 31l19.4 19.4c15.8-6.9 30.8-16.5 43.8-29.5 37.1-37.1 49.7-89.3 37.9-136.7-2.2-9-13.5-12.1-20.1-5.5l-74.4 74.4-67.9-11.3L334 98.9l74.4-74.4c6.6-6.6 3.4-17.9-5.7-20.2-47.4-11.7-99.6.9-136.6 37.9-28.5 28.5-41.9 66.1-41.2 103.6l82.1 82.1c8.1-1.9 16.5-2.9 24.7-2.9zm-103.9 82l-56.7-56.7L18.7 402.8c-25 25-25 65.5 0 90.5s65.5 25 90.5 0l123.6-123.6c-7.6-19.9-9.9-41.6-5-62.7z'],
        help: ['0 0 512 512', 'M504 256c0 136.997-111.043 248-248 248S8 392.997 8 256C8 119.083 119.043 8 256 8s248 111.083 248 248zM262.655 90c-54.497 0-89.255 22.957-116.549 63.758-3.536 5.286-2.353 12.415 2.715 16.258l34.699 26.31c5.205 3.947 12.621 3.008 16.665-2.122 17.864-22.658 30.113-35.797 57.303-35.797 20.429 0 45.698 13.148 45.698 32.958 0 14.976-12.363 22.667-32.534 33.976C247.128 238.528 216 254.941 216 296v4c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12v-1.333c0-28.462 83.186-29.647 83.186-106.667 0-58.002-60.165-102-116.531-102zM256 338c-25.365 0-46 20.635-46 46 0 25.364 20.635 46 46 46s46-20.636 46-46c0-25.365-20.635-46-46-46z'],
        close: ['0 0 352 512', 'M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z'],
        chevronDown: ['0 0 448 512', 'M207.029 381.476L12.686 187.132c-9.373-9.373-9.373-24.569 0-33.941l22.667-22.667c9.357-9.357 24.522-9.375 33.901-.04L224 284.505l154.745-154.021c9.379-9.335 24.544-9.317 33.901.04l22.667 22.667c9.373 9.373 9.373 24.569 0 33.941L240.971 381.476c-9.373 9.372-24.569 9.372-33.942 0z'],
        chevronUp: ['0 0 448 512', 'M240.971 130.524l194.343 194.343c9.373 9.373 9.373 24.569 0 33.941l-22.667 22.667c-9.357 9.357-24.522 9.375-33.901.04L224 227.495 69.255 381.516c-9.379 9.335-24.544 9.317-33.901-.04l-22.667-22.667c-9.373-9.373-9.373-24.569 0-33.941L207.03 130.525c9.372-9.373 24.568-9.373 33.941-.001z'],
        ellipsis: ['0 0 512 512', 'M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z'],
        play: ['0 0 448 512', 'M424.4 214.7L72.4 6.6C43.8-10.3 0 6.1 0 47.9V464c0 37.5 40.7 60.1 72.4 41.3l352-208c31.4-18.5 31.5-64.1 0-82.6z'],
        stop: ['0 0 448 512', 'M400 32H48C21.5 32 0 53.5 0 75v362c0 21.5 21.5 43 48 43h352c26.5 0 48-21.5 48-43V75c0-21.5-21.5-43-48-43z'],
        save: ['0 0 448 512', 'M433.941 129.941l-83.882-83.882A48 48 0 0 0 316.118 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48V163.882a48 48 0 0 0-14.059-33.941zM224 416c-35.346 0-64-28.654-64-64 0-35.346 28.654-64 64-64s64 28.654 64 64c0 35.346-28.654 64-64 64zm96-304.52V212c0 6.627-5.373 12-12 12H76c-6.627 0-12-5.373-12-12V108c0-6.627 5.373-12 12-12h228.52c3.183 0 6.235 1.264 8.485 3.515l3.48 3.48A11.996 11.996 0 0 1 320 111.48z'],
        add: ['0 0 448 512', 'M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z'],
        trash: ['0 0 448 512', 'M432 32H312l-9.4-18.7A24 24 0 0 0 281.1 0H166.8a23.72 23.72 0 0 0-21.4 13.3L136 32H16A16 16 0 0 0 0 48v32a16 16 0 0 0 16 16h416a16 16 0 0 0 16-16V48a16 16 0 0 0-16-16zM53.2 467a48 48 0 0 0 47.9 45h245.8a48 48 0 0 0 47.9-45L416 128H32z'],
        refresh: ['0 0 512 512', 'M440.65 12.57l4 82.77A247.16 247.16 0 0 0 255.83 8C134.73 8 33.91 94.92 12.29 209.82A12 12 0 0 0 24.09 224h49.05a12 12 0 0 0 11.67-9.26 175.91 175.91 0 0 1 317-56.94l-101.46-4.86a12 12 0 0 0-12.57 12v47.41a12 12 0 0 0 12 12H500a12 12 0 0 0 12-12V12a12 12 0 0 0-12-12h-47.37a12 12 0 0 0-11.98 12.57zM255.83 432a175.61 175.61 0 0 1-146-77.8l101.8 4.87a12 12 0 0 0 12.57-12v-47.4a12 12 0 0 0-12-12H12a12 12 0 0 0-12 12V500a12 12 0 0 0 12 12h47.35a12 12 0 0 0 12-12.6l-4.15-82.57A247.17 247.17 0 0 0 255.83 504c121.11 0 221.93-86.92 243.55-201.82a12 12 0 0 0-11.8-14.18h-49.05a12 12 0 0 0-11.67 9.26A175.86 175.86 0 0 1 255.83 432z'],
        warn: ['0 0 576 512', 'M569.517 440.013C587.975 472.007 564.806 512 527.94 512H48.054c-36.937 0-59.999-40.055-41.577-71.987L246.423 23.985c18.467-32.009 64.72-31.951 83.154 0l239.94 416.028zM288 354c-25.405 0-46 20.595-46 46s20.595 46 46 46 46-20.595 46-46-20.595-46-46-46zm-43.673-165.346l7.418 136c.347 6.364 5.609 11.346 11.982 11.346h48.546c6.373 0 11.635-4.982 11.982-11.346l7.418-136c.375-6.874-5.098-12.654-11.982-12.654h-63.383c-6.884 0-12.356 5.78-11.981 12.654z'],
        tp: ['0 0 512 512', 'M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 56c106.039 0 192 85.961 192 192s-85.961 192-192 192S64 362.039 64 256 149.961 64 256 64zm32.066 96.043c-6.599-6.599-17.29-6.599-23.889 0l-83.955 83.955c-6.599 6.599-6.599 17.29 0 23.889l83.955 83.955c6.599 6.599 17.29 6.599 23.889 0l11.222-11.222c6.703-6.703 6.575-17.611-.283-24.146L269.336 288H384c9.941 0 18-8.059 18-18v-28c0-9.941-8.059-18-18-18H269.336l29.688-28.474c6.858-6.535 6.986-17.443.283-24.146l-11.241-11.337z']
    };

    function svg(name, cls) {
        var i = ICONS[name];
        if (!i) return '';
        return '<svg class="' + (cls || 'mdt-svg') + '" viewBox="' + i[0] + '" aria-hidden="true"><path d="' + i[1] + '"></path></svg>';
    }

    var ROLE_RANK = { player: 0, staff: 1, dev: 2 };
    var TOPBAR_OFFSET = 64;
    var EDGE = 12;
    var MIN_Y = 52;
    var Z_BASE = 1000;

    /* ── Registre des outils (structure AVA : rôles, tailles, fenêtres, requires) ── */
    var TOOLS = [
        { id: 'home', label: 'Accueil', icon: 'home', role: 'dev', requires: [], defaultSize: { w: 380, h: 360 }, build: buildHome },
        { id: 'emote-creator', label: 'Emote Creator', icon: 'emote', role: 'player', requires: [], defaultSize: { w: 420, h: 640 }, flush: true, build: buildEmoteCreator },
        { id: 'mocap-studio', label: 'Mocap Studio', icon: 'mocap', role: 'player', requires: ['api'], defaultSize: { w: 420, h: 640 }, flush: true, build: apiPanel('Mocap Studio', 'Capture de mouvement (vidéo) convertie en animation jouable.') },
        { id: 'ped-tattoo', label: 'Tattoo', icon: 'tattoo', role: 'player', requires: [], bridge: 'ped-tattoo' },
        { id: 'ped-viewer', label: 'Peds', icon: 'ped', role: 'staff', requires: [], defaultSize: { w: 400, h: 620 }, build: buildPedViewer },
        { id: 'vehicle-viewer', label: 'Vehicles', icon: 'car', role: 'staff', requires: [], bridge: 'vehicle-viewer' },
        {
            id: 'mapper', label: 'Mapper', icon: 'mapper', role: 'dev', requires: [],
            windows: [
                { id: 'outliner', label: 'Éléments', icon: 'layers', defaultSize: { w: 320, h: 2000 }, defaultOpen: true, defaultAnchor: 'top-left', build: buildMapperOutliner },
                { id: 'inspector', label: 'Inspecteur', icon: 'edit', defaultSize: { w: 380, h: 2000 }, defaultOpen: true, defaultAnchor: 'top-right', defaultInset: { bottom: 308 }, build: buildMapperInspector },
                { id: 'library', label: 'Bibliothèque', icon: 'mapper', defaultSize: { w: 4000, h: 300 }, defaultOpen: true, defaultAnchor: 'bottom-left', defaultInset: { left: 328 }, build: infoPanel('Bibliothèque', "Placement de props : utilisez le menu props existant de la base. L'intégration drag & drop arrive dans une prochaine phase.") },
                { id: 'shows', label: 'Light Shows', icon: 'light', defaultSize: { w: 900, h: 620 }, defaultCollapsed: true, defaultAnchor: 'bottom-right', build: infoPanel('Light Shows', 'Les shows lumière utilisent le système lightshow existant de la base.') },
                { id: 'options', label: 'Options', icon: 'tools', defaultSize: { w: 640, h: 460 }, defaultAnchor: 'bottom-right', build: infoPanel('Options', 'Options du mapper (densité, heure forcée, météo) — prochaine phase.') }
            ]
        },
        {
            id: 'light', label: 'Light', icon: 'light', role: 'dev', requires: [], hidden: true,
            windows: [
                { id: 'outliner', label: 'Éléments', icon: 'layers', defaultSize: { w: 320, h: 500 }, defaultOpen: true, defaultAnchor: 'top-left', build: buildMapperOutliner },
                { id: 'inspector', label: 'Inspecteur', icon: 'edit', defaultSize: { w: 380, h: 620 }, defaultOpen: true, defaultAnchor: 'top-right', build: buildMapperInspector },
                { id: 'shows', label: 'Shows', icon: 'light', defaultSize: { w: 900, h: 620 }, defaultOpen: true, defaultCollapsed: true, defaultAnchor: 'bottom-right', build: infoPanel('Shows', 'Shows lumière — système lightshow de la base.') }
            ]
        },
        { id: 'audio', label: 'Audio Occlusion', icon: 'audio', role: 'dev', requires: ['api'], defaultSize: { w: 380, h: 560 }, build: apiPanel('Audio Occlusion', 'Génération des occlusions audio des intérieurs (ymt).') },
        { id: 'doors', label: 'Doors Tuning', icon: 'door', role: 'dev', requires: ['api'], defaultSize: { w: 380, h: 560 }, build: apiPanel('Doors Tuning', 'Réglage des portes (doortuning) des mappings.') },
        { id: 'occlusion', label: 'Occlusion', icon: 'eye', role: 'dev', requires: ['api'], defaultSize: { w: 380, h: 560 }, build: apiPanel('Occlusion', 'Box occluders / occlude models des ymaps.') },
        { id: 'scenarios', label: 'Scenarios', icon: 'scenarios', role: 'dev', requires: ['api'], defaultSize: { w: 380, h: 560 }, build: apiPanel('Scenarios', 'Édition des points de scénario PNJ.') },
        { id: 'ymap-viewer', label: 'YMap Viewer', icon: 'map', role: 'dev', requires: ['api'], defaultSize: { w: 400, h: 600 }, build: apiPanel('YMap Viewer', 'Chargement et inspection des ymaps du serveur.') },
        { id: 'ybn-viewer', label: 'Collision', icon: 'collision', role: 'dev', requires: ['api'], defaultSize: { w: 380, h: 560 }, build: apiPanel('Collision', 'Visualisation et édition des collisions (ybn).') },
        {
            id: 'world-viewer', label: 'World Viewer', icon: 'world', role: 'dev', requires: ['api'],
            windows: [
                { id: 'layers', label: 'Layers', icon: 'layers', defaultSize: { w: 300, h: 440 }, defaultOpen: true, defaultAnchor: 'top-left', flush: true, build: apiPanel('Layers', 'Couches du monde (ymap, collisions, scénarios, occluders).') },
                { id: 'editor', label: 'Editor', icon: 'edit', defaultSize: { w: 380, h: 560 }, defaultOpen: true, defaultAnchor: 'top-right', flush: true, build: apiPanel('Editor', 'Édition de la couche focus (gizmo).') }
            ]
        },
        { id: 'map-conflict', label: 'Map Conflicts', icon: 'conflict', role: 'dev', requires: ['api'], defaultSize: { w: 720, h: 680 }, build: apiPanel('Map Conflicts', "Scan des mappings en conflit et génération d'une ressource override (merge 3-way).") },
        { id: 'cinematics', label: 'Cinematics', icon: 'film', role: 'dev', requires: ['api'], defaultSize: { w: 440, h: 660 }, flush: true, build: apiPanel('Cinematics', 'Timeline cinématique (caméras, acteurs, FX, texte 3D).') },
        { id: 'blueprint', label: 'Blueprint', icon: 'blueprint', role: 'staff', requires: [], defaultSize: { w: 1180, h: 720 }, flush: true, maximized: true, build: buildBlueprint }
    ];

    function toolById(id) {
        for (var i = 0; i < TOOLS.length; i++) if (TOOLS[i].id === id) return TOOLS[i];
        return null;
    }

    function baseToolId(windowId) {
        var idx = windowId.indexOf(':');
        return idx === -1 ? windowId : windowId.slice(0, idx);
    }

    function toolWindows(tool) {
        if (tool.windows) {
            return tool.windows.map(function (w) {
                return {
                    windowId: tool.id + ':' + w.id, toolId: tool.id, label: w.label,
                    icon: w.icon || tool.icon, defaultSize: w.defaultSize, flush: w.flush,
                    defaultOpen: w.defaultOpen, defaultCollapsed: w.defaultCollapsed,
                    defaultAnchor: w.defaultAnchor, defaultInset: w.defaultInset,
                    maximized: w.maximized, build: w.build
                };
            });
        }
        return [{
            windowId: tool.id, toolId: tool.id, label: tool.label, icon: tool.icon,
            defaultSize: tool.defaultSize || { w: 380, h: 480 }, flush: tool.flush,
            defaultOpen: false, maximized: tool.maximized, build: tool.build
        }];
    }

    function allWindows() {
        var out = [];
        TOOLS.forEach(function (t) { toolWindows(t).forEach(function (w) { out.push(w); }); });
        return out;
    }

    function visibleTools(scope) {
        var rank = ROLE_RANK[scope] || 0;
        return TOOLS.filter(function (t) { return ROLE_RANK[t.role] <= rank && !t.hidden; });
    }

    function defaultToolFor(scope) {
        if (scope === 'player') return 'emote-creator';
        if (scope === 'staff') return 'vehicle-viewer';
        return 'home';
    }

    function requiresApi(tool) {
        return !!tool && (tool.requires || []).indexOf('api') !== -1;
    }

    /* Placement par ancre (équivalent jm1). */
    function defaultBounds(win, index) {
        var size = win.defaultSize;
        var vw = window.innerWidth, vh = window.innerHeight;
        if (win.maximized) {
            var m = 24;
            return { x: m, y: TOPBAR_OFFSET, w: Math.max(Math.min(size.w, vw - m * 2), Math.min(size.w, vw - m * 2)), h: Math.max(160, vh - TOPBAR_OFFSET - m) };
        }
        if (!win.defaultAnchor) {
            return { x: 20 + index * 26, y: TOPBAR_OFFSET + index * 22, w: Math.min(size.w, vw - 24), h: Math.min(size.h, vh - TOPBAR_OFFSET - EDGE) };
        }
        var w = Math.min(size.w, vw - EDGE * 2);
        var h = Math.min(size.h, vh - TOPBAR_OFFSET - EDGE);
        var x = win.defaultAnchor.indexOf('right') !== -1 ? Math.max(EDGE, vw - w - EDGE) : EDGE;
        var y = win.defaultAnchor.indexOf('bottom') !== -1 ? Math.max(TOPBAR_OFFSET, vh - h - EDGE) : TOPBAR_OFFSET;
        var inset = win.defaultInset;
        if (inset) {
            if (inset.left) { x += inset.left; w = Math.max(120, w - inset.left); }
            if (inset.right) { w = Math.max(120, w - inset.right); }
            if (inset.bottom) { h = Math.max(120, h - inset.bottom); }
        }
        return { x: x, y: y, w: w, h: h };
    }

    /* ── État ────────────────────────────────────────────────── */

    var state = {
        open: false,
        scope: 'dev',
        lockedTool: null,
        activeTool: 'home',
        apiDown: true,
        zCounter: Z_BASE,
        windows: {},
        helpOpen: false,
        menuOpen: false,
        moreOpen: false
    };

    var shared = {
        mapperSelection: null,
        mapperInspectorRender: null
    };

    function ensureWindowState(win, index) {
        if (state.windows[win.windowId]) return state.windows[win.windowId];
        var b = defaultBounds(win, index);
        state.windows[win.windowId] = {
            open: false, collapsed: !!win.defaultCollapsed,
            x: b.x, y: b.y, w: b.w, h: b.h, z: Z_BASE + index
        };
        return state.windows[win.windowId];
    }

    /* ── DOM racine ──────────────────────────────────────────── */

    var root = document.createElement('div');
    root.id = 'modding-shell-root';
    root.setAttribute('aria-hidden', 'true');
    root.innerHTML = [
        '<header class="mdt-topbar">',
        '  <div class="mdt-topbar-left">',
        '    <div class="mdt-brand">Ava</div>',
        '    <div class="mdt-menu-wrap" id="mdt-tools-wrap">',
        '      <button class="mdt-icon-btn" id="mdt-tools-btn" title="Outils">' + svg('tools') + '</button>',
        '      <div class="mdt-menu" id="mdt-tools-menu" style="display:none"></div>',
        '    </div>',
        '    <div class="mdt-sep"></div>',
        '    <div class="mdt-topbar-title" id="mdt-title">Modding</div>',
        '  </div>',
        '  <div class="mdt-topbar-center"><div class="mdt-gizmo" id="mdt-gizmo" style="display:none"></div></div>',
        '  <div class="mdt-topbar-right">',
        '    <nav class="mdt-tabs" id="mdt-tabs"></nav>',
        '    <div class="mdt-sep"></div>',
        '    <button class="mdt-icon-btn" id="mdt-help-btn" title="Contrôles caméra">' + svg('help') + '</button>',
        '    <button class="mdt-icon-btn" id="mdt-close-btn" title="Fermer">' + svg('close') + '</button>',
        '  </div>',
        '</header>',
        '<div id="mdt-windows"></div>',
        '<div class="mdt-help-overlay" id="mdt-help" style="display:none">',
        '  <div class="mdt-help-card">',
        '    <h3>Contrôles caméra</h3>',
        '    <div class="mdt-help-grid">',
        '      <div class="mdt-help-item"><kbd>Z / W</kbd><span>Avancer</span></div>',
        '      <div class="mdt-help-item"><kbd>S</kbd><span>Reculer</span></div>',
        '      <div class="mdt-help-item"><kbd>Q / A</kbd><span>Gauche</span></div>',
        '      <div class="mdt-help-item"><kbd>D</kbd><span>Droite</span></div>',
        '      <div class="mdt-help-item"><kbd>Espace</kbd><span>Monter</span></div>',
        '      <div class="mdt-help-item"><kbd>Ctrl</kbd><span>Descendre</span></div>',
        '      <div class="mdt-help-item"><kbd>Shift</kbd><span>Accélérer</span></div>',
        '      <div class="mdt-help-item"><kbd>Clic droit</kbd><span>Tourner la caméra</span></div>',
        '      <div class="mdt-help-item"><kbd>Molette</kbd><span>Zoom</span></div>',
        '      <div class="mdt-help-item"><kbd>Échap</kbd><span>Fermer l\'outil</span></div>',
        '    </div>',
        '    <button class="mdt-help-close" id="mdt-help-close">Compris</button>',
        '  </div>',
        '</div>'
    ].join('\n');
    document.body.appendChild(root);

    var els = {
        title: root.querySelector('#mdt-title'),
        tabs: root.querySelector('#mdt-tabs'),
        toolsBtn: root.querySelector('#mdt-tools-btn'),
        toolsMenu: root.querySelector('#mdt-tools-menu'),
        toolsWrap: root.querySelector('#mdt-tools-wrap'),
        helpBtn: root.querySelector('#mdt-help-btn'),
        help: root.querySelector('#mdt-help'),
        windows: root.querySelector('#mdt-windows')
    };

    /* ── Fenêtres ────────────────────────────────────────────── */

    var windowEls = {};
    var windowDefs = {};
    allWindows().forEach(function (w, i) { w._index = i; windowDefs[w.windowId] = w; });

    function buildWindow(win) {
        if (windowEls[win.windowId]) return windowEls[win.windowId];
        var el = document.createElement('section');
        el.className = 'mdt-window';
        el.dataset.window = win.windowId;
        el.innerHTML = [
            '<div class="mdt-resize-edge-top" title="Redimensionner en hauteur"></div>',
            '<header class="mdt-window-header">',
            '  <button class="mdt-collapse-btn" title="Réduire">' + svg('chevronDown') + '</button>',
            '  <span class="mdt-window-icon">' + svg(win.icon) + '</span>',
            '  <span class="mdt-window-title">' + win.label + '</span>',
            '  <button class="mdt-close-btn" title="Fermer">' + svg('close') + '</button>',
            '</header>',
            '<div class="mdt-window-body' + (win.flush ? ' flush' : '') + '"></div>',
            '<div class="mdt-resize-grip"></div>'
        ].join('');
        els.windows.appendChild(el);
        var record = { el: el, body: el.querySelector('.mdt-window-body'), built: false };
        windowEls[win.windowId] = record;
        wireWindow(win, record);
        return record;
    }

    function wireWindow(win, record) {
        var el = record.el;
        var id = win.windowId;
        var header = el.querySelector('.mdt-window-header');
        var edgeTop = el.querySelector('.mdt-resize-edge-top');
        var grip = el.querySelector('.mdt-resize-grip');
        var minW = 280, minH = 160;

        el.addEventListener('pointerdown', function () { focusWindow(id); }, true);
        el.querySelector('.mdt-collapse-btn').addEventListener('click', function () { toggleCollapse(id); });
        el.querySelector('.mdt-close-btn').addEventListener('click', function () { closeWindow(id); });

        var drag = null;
        header.addEventListener('pointerdown', function (e) {
            if (e.target.closest('button')) return;
            e.preventDefault();
            focusWindow(id);
            var w = state.windows[id];
            drag = { px: e.clientX, py: e.clientY, ox: w.x, oy: w.y };
            header.setPointerCapture(e.pointerId);
        });
        header.addEventListener('pointermove', function (e) {
            if (!drag) return;
            if (e.buttons === 0) { drag = null; return; }
            var w = state.windows[id];
            w.x = Math.max(0, Math.min(window.innerWidth - 80, drag.ox + (e.clientX - drag.px)));
            w.y = Math.max(MIN_Y, Math.min(window.innerHeight - 38, drag.oy + (e.clientY - drag.py)));
            applyBounds(id);
        });
        header.addEventListener('pointerup', function (e) {
            drag = null;
            try { header.releasePointerCapture(e.pointerId); } catch (err) { }
        });

        var resize = null;
        grip.addEventListener('pointerdown', function (e) {
            e.preventDefault();
            e.stopPropagation();
            focusWindow(id);
            var w = state.windows[id];
            resize = { px: e.clientX, py: e.clientY, ow: w.w, oh: w.h };
            grip.setPointerCapture(e.pointerId);
        });
        grip.addEventListener('pointermove', function (e) {
            if (!resize) return;
            if (e.buttons === 0) { resize = null; return; }
            var w = state.windows[id];
            w.w = Math.max(minW, Math.min(window.innerWidth - w.x - 8, resize.ow + (e.clientX - resize.px)));
            w.h = Math.max(minH, Math.min(window.innerHeight - w.y - 8, resize.oh + (e.clientY - resize.py)));
            applyBounds(id);
        });
        grip.addEventListener('pointerup', function (e) {
            resize = null;
            try { grip.releasePointerCapture(e.pointerId); } catch (err) { }
        });

        var topResize = null;
        edgeTop.addEventListener('pointerdown', function (e) {
            e.preventDefault();
            e.stopPropagation();
            focusWindow(id);
            var w = state.windows[id];
            topResize = { py: e.clientY, oy: w.y, oh: w.h };
            edgeTop.setPointerCapture(e.pointerId);
        });
        edgeTop.addEventListener('pointermove', function (e) {
            if (!topResize) return;
            if (e.buttons === 0) { topResize = null; return; }
            var w = state.windows[id];
            var bottom = topResize.oy + topResize.oh;
            var y = Math.max(MIN_Y, Math.min(bottom - minH, topResize.oy + (e.clientY - topResize.py)));
            w.y = y;
            w.h = bottom - y;
            applyBounds(id);
        });
        edgeTop.addEventListener('pointerup', function (e) {
            topResize = null;
            try { edgeTop.releasePointerCapture(e.pointerId); } catch (err) { }
        });
    }

    function applyBounds(id) {
        var record = windowEls[id];
        var w = state.windows[id];
        if (!record || !w) return;
        record.el.style.left = w.x + 'px';
        record.el.style.top = w.y + 'px';
        record.el.style.width = w.w + 'px';
        record.el.style.height = w.collapsed ? 'auto' : w.h + 'px';
        record.el.style.zIndex = w.z;
    }

    function renderWindow(id) {
        var win = windowDefs[id];
        var w = state.windows[id];
        if (!win || !w) return;
        var record = buildWindow(win);
        record.el.style.display = w.open ? '' : 'none';
        record.el.classList.toggle('active', state.activeTool === win.toolId);
        record.el.classList.toggle('collapsed', !!w.collapsed);
        record.el.querySelector('.mdt-collapse-btn').innerHTML = svg(w.collapsed ? 'chevronUp' : 'chevronDown');
        record.body.style.display = w.collapsed ? 'none' : '';
        record.el.querySelector('.mdt-resize-grip').style.display = w.collapsed ? 'none' : '';
        record.el.querySelector('.mdt-resize-edge-top').style.display = w.collapsed ? 'none' : '';
        if (w.open && !record.built && win.build) {
            win.build(record.body);
            record.built = true;
        }
        applyBounds(id);
    }

    function focusWindow(id) {
        var w = state.windows[id];
        if (!w) return;
        state.zCounter += 1;
        w.z = state.zCounter;
        state.activeTool = baseToolId(id);
        renderAll();
    }

    function anyToolWindowOpen(toolId) {
        return Object.keys(state.windows).some(function (k) {
            return baseToolId(k) === toolId && state.windows[k].open;
        });
    }

    function closeHomeIfNeeded(toolId) {
        if (toolId !== 'home' && state.windows.home && state.windows.home.open) {
            state.windows.home.open = false;
        }
    }

    function openWindow(id) {
        var win = windowDefs[id];
        if (!win) return;
        var w = ensureWindowState(win, win._index);
        state.zCounter += 1;
        w.open = true;
        w.collapsed = false;
        w.z = state.zCounter;
        closeHomeIfNeeded(win.toolId);
        state.activeTool = win.toolId;
        renderAll();
    }

    function openTool(toolId) {
        var tool = toolById(toolId);
        if (!tool) return;
        if (tool.bridge) {
            nui('moddingShell:openTool', { tool: tool.bridge });
            renderAll();
            return;
        }
        var wins = toolWindows(tool);
        var opened = tool.windows ? wins.filter(function (w) { return w.defaultOpen; }) : wins;
        var target = opened.length ? opened : wins;
        target.forEach(function (win) {
            var def = windowDefs[win.windowId];
            var w = ensureWindowState(def, def._index);
            state.zCounter += 1;
            w.open = true;
            w.collapsed = !!def.defaultCollapsed;
            w.z = state.zCounter;
        });
        closeHomeIfNeeded(toolId);
        state.activeTool = toolId;
        renderAll();
    }

    function closeWindow(id) {
        var w = state.windows[id];
        if (!w) return;
        w.open = false;
        var toolId = baseToolId(id);
        if (state.activeTool === toolId && !anyToolWindowOpen(toolId)) {
            state.activeTool = 'home';
        }
        renderAll();
    }

    function toggleWindow(id) {
        var w = state.windows[id];
        if (w && w.open) closeWindow(id);
        else openWindow(id);
    }

    function toggleCollapse(id) {
        var w = state.windows[id];
        if (!w) return;
        w.collapsed = !w.collapsed;
        renderAll();
    }

    /* ── Topbar ──────────────────────────────────────────────── */

    function toolDisabled(tool) {
        return state.apiDown && requiresApi(tool);
    }

    function toolTitle(tool) {
        return toolDisabled(tool) ? tool.label + ' (hors ligne — serveur modding-tool requis)' : tool.label;
    }

    /* L'outil actif multi-fenêtres est déplié en un onglet par fenêtre. */
    function tabEntries(tools) {
        var out = [];
        tools.forEach(function (tool) {
            if (tool.bridge) {
                out.push({ windowId: tool.id, toolId: tool.id, label: tool.label, icon: tool.icon, isBridge: true });
                return;
            }
            if (tool.windows && state.activeTool === tool.id) {
                toolWindows(tool).forEach(function (w) {
                    out.push({ windowId: w.windowId, toolId: tool.id, label: w.label, icon: w.icon });
                });
            } else {
                out.push({ windowId: tool.id, toolId: tool.id, label: tool.label, icon: tool.icon, isLauncher: !!tool.windows });
            }
        });
        return out;
    }

    function entryOpen(entry) {
        if (entry.isBridge) return false;
        if (entry.isLauncher) return anyToolWindowOpen(entry.toolId);
        return !!(state.windows[entry.windowId] && state.windows[entry.windowId].open);
    }

    function renderTopbar() {
        var tools = state.lockedTool ? [toolById(state.lockedTool)].filter(Boolean) : visibleTools(state.scope);
        var active = toolById(state.activeTool);
        els.title.textContent = active ? active.label : 'Modding';

        els.toolsMenu.innerHTML = '';
        tools.forEach(function (tool) {
            var isOpen = tool.windows ? anyToolWindowOpen(tool.id) : !!(state.windows[tool.id] && state.windows[tool.id].open);
            var btn = document.createElement('button');
            btn.className = 'mdt-menu-item' + (isOpen ? ' open' : '');
            btn.disabled = toolDisabled(tool);
            btn.title = toolTitle(tool);
            btn.innerHTML = '<span class="mdt-menu-icon">' + svg(tool.icon) + '</span><span>' + tool.label + '</span>';
            btn.addEventListener('click', function () {
                state.menuOpen = false;
                if (tool.windows || tool.bridge) openTool(tool.id);
                else toggleWindow(tool.id);
            });
            els.toolsMenu.appendChild(btn);
        });
        els.toolsMenu.style.display = state.menuOpen ? '' : 'none';
        els.toolsBtn.classList.toggle('active', state.menuOpen);

        var entries = tabEntries(tools);
        var shown = entries.filter(function (e) { return e.toolId === state.activeTool || entryOpen(e); });
        var rest = entries.filter(function (e) { return e.toolId !== state.activeTool && !entryOpen(e); });
        els.tabs.innerHTML = '';
        function tabFor(entry) {
            var tool = toolById(entry.toolId);
            var btn = document.createElement('button');
            btn.className = 'mdt-tab' + (entryOpen(entry) ? ' open' : '') + (state.activeTool === entry.toolId ? ' tab-active' : '');
            btn.disabled = !!tool && toolDisabled(tool);
            btn.title = tool && entry.label === tool.label ? toolTitle(tool) : entry.label;
            btn.innerHTML = svg(entry.icon);
            btn.addEventListener('click', function () {
                if (entry.isBridge || entry.isLauncher) openTool(entry.toolId);
                else toggleWindow(entry.windowId);
            });
            els.tabs.appendChild(btn);
        }
        shown.forEach(tabFor);
        if (rest.length > 0) {
            var more = document.createElement('button');
            more.className = 'mdt-tab';
            more.title = state.moreOpen ? 'Masquer' : rest.length + ' outils de plus';
            more.innerHTML = svg(state.moreOpen ? 'chevronUp' : 'ellipsis');
            more.addEventListener('click', function () {
                state.moreOpen = !state.moreOpen;
                renderTopbar();
            });
            els.tabs.appendChild(more);
            if (state.moreOpen) rest.forEach(tabFor);
        }

        els.helpBtn.style.display = state.scope === 'player' ? 'none' : '';
        els.help.style.display = state.helpOpen ? '' : 'none';
    }

    function renderAll() {
        renderTopbar();
        Object.keys(state.windows).forEach(renderWindow);
    }

    els.toolsBtn.addEventListener('click', function () {
        state.menuOpen = !state.menuOpen;
        renderTopbar();
    });
    window.addEventListener('mousedown', function (e) {
        if (state.menuOpen && !(e.target instanceof Node && els.toolsWrap.contains(e.target))) {
            state.menuOpen = false;
            renderTopbar();
        }
    });
    els.helpBtn.addEventListener('click', function () {
        state.helpOpen = !state.helpOpen;
        renderTopbar();
    });
    root.querySelector('#mdt-help-close').addEventListener('click', function () {
        state.helpOpen = false;
        renderTopbar();
    });
    root.querySelector('#mdt-close-btn').addEventListener('click', closeShell);
    window.addEventListener('keydown', function (e) {
        if (!state.open) return;
        if (e.key === 'Escape') {
            if (state.helpOpen) {
                state.helpOpen = false;
                renderTopbar();
                return;
            }
            closeShell();
        }
    });

    /* ── Panneaux génériques ─────────────────────────────────── */

    function buildHome(body) {
        body.innerHTML = '<div class="mdt-home"><div class="mdt-home-hint">Sélectionnez un outil pour commencer.</div></div>';
        var wrap = body.querySelector('.mdt-home');
        visibleTools(state.scope).forEach(function (tool) {
            if (tool.id === 'home') return;
            var btn = document.createElement('button');
            btn.className = 'mdt-home-tool';
            btn.disabled = toolDisabled(tool);
            btn.title = toolTitle(tool);
            btn.innerHTML = '<span class="mdt-menu-icon">' + svg(tool.icon) + '</span><span>' + tool.label + '</span>';
            btn.addEventListener('click', function () { openTool(tool.id); });
            wrap.appendChild(btn);
        });
    }

    function infoPanel(title, message) {
        return function (body) {
            body.innerHTML = '<div class="mdt-home"><div class="mdt-home-hint">' + title + '</div><div class="mdt-status">' + message + '</div></div>';
        };
    }

    /* Outils dépendant du serveur modding-tool local : bannière hors-ligne fidèle à l'état AVA offline. */
    function apiPanel(title, description) {
        return function (body) {
            function render() {
                body.innerHTML = [
                    '<div class="mdt-api-panel">',
                    state.apiDown
                        ? '<div class="mdt-banner err">' + svg('warn') + '<span>API indisponible — démarrez le serveur modding-tool (tools/modding-tool).</span></div>'
                        : '<div class="mdt-banner ok">' + svg('refresh') + '<span>API connectée.</span></div>',
                    '<div class="mdt-home-hint">' + title + '</div>',
                    '<div class="mdt-status">' + description + '</div>',
                    '<div class="mdt-row" style="margin-top:10px"><button class="mdt-btn" data-ping>' + svg('refresh') + 'Re-tester la connexion</button></div>',
                    '</div>'
                ].join('');
                body.querySelector('[data-ping]').addEventListener('click', function () {
                    nui('moddingShell:pingApi', {}).then(function (r) {
                        state.apiDown = !(r && r.up);
                        render();
                        renderTopbar();
                    });
                });
            }
            render();
        };
    }

    /* ── Emote Creator ───────────────────────────────────────── */

    function buildEmoteCreator(body) {
        body.innerHTML = [
            '<div class="mdt-emote-panel">',
            '  <div class="mdt-field"><label>Dictionnaire d\'animation</label>',
            '    <input class="mdt-input" id="mdt-ec-dict" placeholder="mini@golf" spellcheck="false"></div>',
            '  <div class="mdt-field"><label>Animation</label>',
            '    <input class="mdt-input" id="mdt-ec-anim" placeholder="wood_idle_c" spellcheck="false"></div>',
            '  <div class="mdt-flag-grid">',
            '    <label class="mdt-flag"><input type="checkbox" id="mdt-ec-loop" checked><span>Boucle</span></label>',
            '    <label class="mdt-flag"><input type="checkbox" id="mdt-ec-upper"><span>Haut du corps</span></label>',
            '    <label class="mdt-flag"><input type="checkbox" id="mdt-ec-move"><span>Autoriser déplacement</span></label>',
            '    <label class="mdt-flag"><input type="checkbox" id="mdt-ec-freeze"><span>Figer à la fin</span></label>',
            '  </div>',
            '  <div class="mdt-row" style="margin-bottom:12px">',
            '    <button class="mdt-btn primary" id="mdt-ec-play">' + svg('play') + 'Jouer</button>',
            '    <button class="mdt-btn" id="mdt-ec-stop">' + svg('stop') + 'Stop</button>',
            '  </div>',
            '  <div class="mdt-field"><label>Référence (unique)</label>',
            '    <input class="mdt-input" id="mdt-ec-ref" placeholder="ma_ref" spellcheck="false" maxlength="32"></div>',
            '  <div class="mdt-field"><label>Nom affiché</label>',
            '    <input class="mdt-input" id="mdt-ec-name" placeholder="Mon emote" maxlength="64"></div>',
            '  <div class="mdt-row" style="margin-bottom:8px">',
            '    <button class="mdt-btn primary" id="mdt-ec-save">' + svg('save') + 'Créer l\'emote</button>',
            '  </div>',
            '  <div class="mdt-status" id="mdt-ec-status"></div>',
            '</div>'
        ].join('');

        function byId(id) { return body.querySelector('#' + id); }
        var status = byId('mdt-ec-status');

        function flags() {
            var value = 0;
            if (byId('mdt-ec-loop').checked) value += 1;
            if (byId('mdt-ec-freeze').checked && !byId('mdt-ec-loop').checked) value += 2;
            if (byId('mdt-ec-upper').checked) value += 16;
            if (byId('mdt-ec-move').checked) value += 32;
            return value;
        }

        function setStatus(text, cls) {
            status.textContent = text || '';
            status.className = 'mdt-status' + (cls ? ' ' + cls : '');
        }

        byId('mdt-ec-play').addEventListener('click', function () {
            var dict = byId('mdt-ec-dict').value.trim();
            var anim = byId('mdt-ec-anim').value.trim();
            if (!dict || !anim) { setStatus('Renseignez le dictionnaire et l\'animation.', 'err'); return; }
            setStatus('Lecture...');
            nui('emoteCreator:play', { dict: dict, anim: anim, flags: flags() }).then(function (result) {
                if (result && result.ok) setStatus('Animation en cours.', 'ok');
                else setStatus((result && result.error) || 'Animation introuvable.', 'err');
            });
        });
        byId('mdt-ec-stop').addEventListener('click', function () {
            nui('emoteCreator:stop', {});
            setStatus('');
        });
        byId('mdt-ec-save').addEventListener('click', function () {
            var dict = byId('mdt-ec-dict').value.trim();
            var anim = byId('mdt-ec-anim').value.trim();
            var ref = byId('mdt-ec-ref').value.trim();
            var name = byId('mdt-ec-name').value.trim();
            if (!dict || !anim || !ref || !name) { setStatus('Tous les champs sont requis.', 'err'); return; }
            setStatus('Création...');
            nui('emoteCreator:create', { dict: dict, anim: anim, ref: ref, name: name, flags: flags() }).then(function (result) {
                if (result && result.ok) setStatus('Emote N°' + result.emoteId + ' créée (à valider dans le menu admin).', 'ok');
                else setStatus((result && result.error) || 'Échec de la création.', 'err');
            });
        });
    }

    /* ── Ped Viewer ──────────────────────────────────────────── */

    var PED_GROUPS = [
        ['Police', ['s_m_y_cop_01', 's_f_y_cop_01', 's_m_y_sheriff_01', 's_f_y_sheriff_01', 's_m_m_fibsec_01', 's_m_y_swat_01', 's_m_m_security_01']],
        ['Gangs', ['g_m_y_ballasout_01', 'g_m_y_famca_01', 'g_m_y_mexgoon_01', 'g_m_m_chigoon_01', 'g_m_y_lost_01']],
        ['Civils', ['a_m_m_business_01', 'a_f_y_business_01', 'a_m_y_hipster_01', 'a_f_y_hipster_01', 'a_m_m_farmer_01', 'a_m_y_skater_01', 'mp_m_freemode_01', 'mp_f_freemode_01']],
        ['Métiers', ['s_m_y_construct_01', 's_m_m_dockwork_01', 's_m_y_dealer_01', 's_m_m_chemsec_01', 's_m_y_garbage', 's_m_m_paramedic_01']],
        ['Histoire', ['player_zero', 'player_one', 'player_two', 'ig_lamardavis', 'ig_lestercrest']]
    ];

    function buildPedViewer(body) {
        body.innerHTML = ['<div class="mdt-emote-panel">',
            '  <div class="mdt-field"><label>Modèle de ped</label>',
            '    <input class="mdt-input" id="mdt-pv-model" placeholder="mp_m_freemode_01" spellcheck="false"></div>',
            '  <div class="mdt-row" style="margin-bottom:10px">',
            '    <button class="mdt-btn primary" id="mdt-pv-apply">Appliquer (temporaire)</button>',
            '    <button class="mdt-btn" id="mdt-pv-perm">Permanent</button>',
            '    <button class="mdt-btn" id="mdt-pv-reset">Réinitialiser</button>',
            '  </div>',
            '  <div class="mdt-status" id="mdt-pv-status"></div>',
            '  <div class="mdt-field" style="margin-top:8px"><label>Recherche</label>',
            '    <input class="mdt-input" id="mdt-pv-search" placeholder="Filtrer..." spellcheck="false"></div>',
            '  <div id="mdt-pv-list"></div>',
            '</div>'].join('');
        var status = body.querySelector('#mdt-pv-status');
        var input = body.querySelector('#mdt-pv-model');
        var list = body.querySelector('#mdt-pv-list');

        function setStatus(text, cls) {
            status.textContent = text || '';
            status.className = 'mdt-status' + (cls ? ' ' + cls : '');
        }

        function apply(permanent) {
            var model = input.value.trim();
            if (!model) { setStatus('Renseignez un modèle.', 'err'); return; }
            setStatus('Application...');
            nui('pedViewer:apply', { model: model, permanent: permanent }).then(function (r) {
                if (r && r.ok) setStatus('Ped appliqué.', 'ok');
                else setStatus((r && r.error) || 'Modèle introuvable.', 'err');
            });
        }

        body.querySelector('#mdt-pv-apply').addEventListener('click', function () { apply(false); });
        body.querySelector('#mdt-pv-perm').addEventListener('click', function () { apply(true); });
        body.querySelector('#mdt-pv-reset').addEventListener('click', function () {
            nui('pedViewer:reset', {}).then(function () { setStatus('Ped réinitialisé.', 'ok'); });
        });

        function renderList(filter) {
            list.innerHTML = '';
            PED_GROUPS.forEach(function (group) {
                var models = group[1].filter(function (m) { return !filter || m.indexOf(filter) !== -1; });
                if (!models.length) return;
                var head = document.createElement('div');
                head.className = 'mdt-home-hint';
                head.style.marginTop = '8px';
                head.textContent = group[0];
                list.appendChild(head);
                models.forEach(function (m) {
                    var btn = document.createElement('button');
                    btn.className = 'mdt-home-tool';
                    btn.innerHTML = '<span class="mdt-menu-icon">' + svg('ped') + '</span><span>' + m + '</span>';
                    btn.addEventListener('click', function () {
                        input.value = m;
                        apply(false);
                    });
                    list.appendChild(btn);
                });
            });
        }
        renderList('');
        body.querySelector('#mdt-pv-search').addEventListener('input', function (e) {
            renderList(e.target.value.trim().toLowerCase());
        });
    }

    /* ── Mapper : outliner + inspecteur des éléments placés ──── */

    function buildMapperOutliner(body) {
        body.innerHTML = [
            '<div class="mdt-outliner">',
            '  <div class="mdt-row" style="margin-bottom:10px">',
            '    <button class="mdt-btn" id="mdt-out-refresh">' + svg('refresh') + 'Rafraîchir</button>',
            '    <span class="mdt-status" id="mdt-out-count"></span>',
            '  </div>',
            '  <div id="mdt-out-list"></div>',
            '</div>'
        ].join('');
        var list = body.querySelector('#mdt-out-list');
        var count = body.querySelector('#mdt-out-count');

        function refresh() {
            count.textContent = 'Chargement...';
            nui('mapper:list', {}).then(function (r) {
                var items = (r && r.items) || [];
                count.textContent = items.length + ' élément' + (items.length > 1 ? 's' : '');
                list.innerHTML = '';
                items.forEach(function (item) {
                    var row = document.createElement('div');
                    row.className = 'mdt-out-row';
                    row.innerHTML = '<span class="mdt-menu-icon">' + svg(item.kind === 'light' ? 'light' : 'mapper') + '</span>'
                        + '<span class="mdt-out-name">' + item.label + '</span>'
                        + '<button class="mdt-tab" title="Téléporter">' + svg('tp') + '</button>'
                        + (item.kind === 'prop' ? '<button class="mdt-tab" title="Supprimer">' + svg('trash') + '</button>' : '');
                    var buttons = row.querySelectorAll('button');
                    buttons[0].addEventListener('click', function (e) {
                        e.stopPropagation();
                        nui('mapper:tp', { x: item.x, y: item.y, z: item.z });
                    });
                    if (buttons[1]) buttons[1].addEventListener('click', function (e) {
                        e.stopPropagation();
                        nui('mapper:deleteProp', { id: item.id }).then(refresh);
                    });
                    row.addEventListener('click', function () {
                        shared.mapperSelection = item;
                        list.querySelectorAll('.mdt-out-row').forEach(function (el) { el.classList.remove('selected'); });
                        row.classList.add('selected');
                        if (shared.mapperInspectorRender) shared.mapperInspectorRender();
                    });
                    list.appendChild(row);
                });
            });
        }
        body.querySelector('#mdt-out-refresh').addEventListener('click', refresh);
        refresh();
    }

    function buildMapperInspector(body) {
        function render() {
            var item = shared.mapperSelection;
            if (!item) {
                body.innerHTML = '<div class="mdt-home"><div class="mdt-home-hint">Inspecteur</div><div class="mdt-status">Sélectionnez un élément dans la fenêtre Éléments.</div></div>';
                return;
            }
            body.innerHTML = [
                '<div class="mdt-home">',
                '  <div class="mdt-home-hint">' + item.label + '</div>',
                '  <div class="mdt-field"><label>Type</label><div class="mdt-status">' + (item.kind === 'light' ? 'Lumière' : 'Prop') + '</div></div>',
                '  <div class="mdt-field"><label>Identifiant</label><div class="mdt-status">' + item.id + '</div></div>',
                '  <div class="mdt-field"><label>Position</label><div class="mdt-status">' + item.x.toFixed(2) + ', ' + item.y.toFixed(2) + ', ' + item.z.toFixed(2) + '</div></div>',
                '  <div class="mdt-row"><button class="mdt-btn primary" data-tp>' + svg('tp') + 'Téléporter</button></div>',
                '</div>'
            ].join('');
            body.querySelector('[data-tp]').addEventListener('click', function () {
                nui('mapper:tp', { x: item.x, y: item.y, z: item.z });
            });
        }
        shared.mapperInspectorRender = render;
        render();
    }

    /* ── Blueprint : éditeur de graphe + exécution serveur ───── */

    var BP_DEFS = {
        ev_command: { title: 'Commande', cat: 'Événements', color: '#b8542c', props: [{ id: 'command', label: 'Commande', ph: 'macommande' }], hasIn: false },
        act_notify: { title: 'Notification', cat: 'Actions', color: '#2c6fb8', props: [{ id: 'message', label: 'Message', ph: 'Bonjour !' }] },
        act_give: { title: 'Donner un item', cat: 'Actions', color: '#2c6fb8', props: [{ id: 'item', label: 'Item', ph: 'bread' }, { id: 'count', label: 'Quantité', ph: '1' }] },
        act_teleport: { title: 'Téléporter', cat: 'Actions', color: '#2c6fb8', props: [{ id: 'x', label: 'X', ph: '0.0' }, { id: 'y', label: 'Y', ph: '0.0' }, { id: 'z', label: 'Z', ph: '72.0' }] },
        act_vehicle: { title: 'Créer un véhicule', cat: 'Actions', color: '#2c6fb8', props: [{ id: 'model', label: 'Modèle', ph: 'sultan' }] },
        act_ped: { title: 'Créer un ped', cat: 'Actions', color: '#2c6fb8', props: [{ id: 'model', label: 'Modèle', ph: 'a_m_m_business_01' }] },
        act_anim: { title: 'Jouer une animation', cat: 'Actions', color: '#2c6fb8', props: [{ id: 'dict', label: 'Dictionnaire', ph: 'mini@golf' }, { id: 'anim', label: 'Animation', ph: 'wood_idle_c' }] },
        act_wait: { title: 'Attendre', cat: 'Actions', color: '#5b21b6', props: [{ id: 'seconds', label: 'Secondes', ph: '1' }] }
    };

    function buildBlueprint(body) {
        var bp = {
            list: [],
            current: null,
            graph: { nodes: [], edges: [] },
            nextId: 1,
            pan: { x: 40, y: 40 },
            linking: null
        };

        body.innerHTML = [
            '<div class="mdt-bp">',
            '  <div class="mdt-bp-topbar">',
            '    <select class="mdt-input" id="bp-select" style="width:180px"><option value="">— Blueprints —</option></select>',
            '    <input class="mdt-input" id="bp-name" placeholder="Nom du blueprint" style="width:200px">',
            '    <label class="mdt-flag"><input type="checkbox" id="bp-enabled"><span>Activé</span></label>',
            '    <div style="flex:1"></div>',
            '    <button class="mdt-btn" id="bp-new">' + svg('add') + 'Nouveau</button>',
            '    <button class="mdt-btn primary" id="bp-save">' + svg('save') + 'Enregistrer</button>',
            '    <button class="mdt-btn" id="bp-delete">' + svg('trash') + 'Supprimer</button>',
            '  </div>',
            '  <div class="mdt-bp-body">',
            '    <div class="mdt-bp-library" id="bp-library"></div>',
            '    <div class="mdt-bp-canvas" id="bp-canvas">',
            '      <svg class="mdt-bp-edges" id="bp-edges"></svg>',
            '      <div class="mdt-bp-nodes" id="bp-nodes"></div>',
            '    </div>',
            '  </div>',
            '  <div class="mdt-bp-status" id="bp-status">Créez un événement Commande, chaînez des actions, puis Enregistrer.</div>',
            '</div>'
        ].join('');

        var canvas = body.querySelector('#bp-canvas');
        var nodesEl = body.querySelector('#bp-nodes');
        var edgesEl = body.querySelector('#bp-edges');
        var statusEl = body.querySelector('#bp-status');
        var selectEl = body.querySelector('#bp-select');
        var nameEl = body.querySelector('#bp-name');
        var enabledEl = body.querySelector('#bp-enabled');

        function setStatus(text, cls) {
            statusEl.textContent = text;
            statusEl.className = 'mdt-bp-status' + (cls ? ' ' + cls : '');
        }

        var library = body.querySelector('#bp-library');
        var cats = {};
        Object.keys(BP_DEFS).forEach(function (key) {
            var def = BP_DEFS[key];
            (cats[def.cat] = cats[def.cat] || []).push(key);
        });
        Object.keys(cats).forEach(function (cat) {
            var head = document.createElement('div');
            head.className = 'mdt-bp-lib-cat';
            head.textContent = cat;
            library.appendChild(head);
            cats[cat].forEach(function (key) {
                var def = BP_DEFS[key];
                var item = document.createElement('button');
                item.className = 'mdt-bp-lib-node';
                item.innerHTML = '<span class="mdt-bp-dot" style="background:' + def.color + '"></span>' + def.title;
                item.addEventListener('click', function () {
                    addNode(key, 60 - bp.pan.x + Math.random() * 80, 60 - bp.pan.y + Math.random() * 80);
                });
                library.appendChild(item);
            });
        });

        function addNode(defKey, x, y) {
            bp.graph.nodes.push({ id: 'n' + (bp.nextId++), def: defKey, x: x, y: y, props: {} });
            renderGraph();
        }

        function removeNode(nodeId) {
            bp.graph.nodes = bp.graph.nodes.filter(function (n) { return n.id !== nodeId; });
            bp.graph.edges = bp.graph.edges.filter(function (e) { return e.from !== nodeId && e.to !== nodeId; });
            renderGraph();
        }

        function portCenter(nodeId, isOut) {
            var el = nodesEl.querySelector('[data-node="' + nodeId + '"] .mdt-bp-port.' + (isOut ? 'out' : 'in'));
            if (!el) return null;
            var canvasRect = canvas.getBoundingClientRect();
            var rect = el.getBoundingClientRect();
            return { x: rect.left - canvasRect.left + rect.width / 2, y: rect.top - canvasRect.top + rect.height / 2 };
        }

        function renderEdges() {
            var paths = bp.graph.edges.map(function (edge) {
                var a = portCenter(edge.from, true);
                var b = portCenter(edge.to, false);
                if (!a || !b) return '';
                var dx = Math.max(40, Math.abs(b.x - a.x) / 2);
                return '<path d="M' + a.x + ' ' + a.y + ' C' + (a.x + dx) + ' ' + a.y + ' ' + (b.x - dx) + ' ' + b.y + ' ' + b.x + ' ' + b.y + '"></path>';
            });
            if (bp.linking && bp.linking.pos) {
                var s = portCenter(bp.linking.from, true);
                if (s) {
                    var p = bp.linking.pos;
                    var dx2 = Math.max(40, Math.abs(p.x - s.x) / 2);
                    paths.push('<path class="pending" d="M' + s.x + ' ' + s.y + ' C' + (s.x + dx2) + ' ' + s.y + ' ' + (p.x - dx2) + ' ' + p.y + ' ' + p.x + ' ' + p.y + '"></path>');
                }
            }
            edgesEl.innerHTML = paths.join('');
        }

        function renderGraph() {
            nodesEl.style.transform = 'translate(' + bp.pan.x + 'px,' + bp.pan.y + 'px)';
            nodesEl.innerHTML = '';
            bp.graph.nodes.forEach(function (node) {
                var def = BP_DEFS[node.def];
                if (!def) return;
                var el = document.createElement('div');
                el.className = 'mdt-bp-node';
                el.dataset.node = node.id;
                el.style.left = node.x + 'px';
                el.style.top = node.y + 'px';
                var propsHtml = def.props.map(function (p) {
                    var value = node.props[p.id] != null ? String(node.props[p.id]).replace(/"/g, '&quot;') : '';
                    return '<label class="mdt-bp-prop"><span>' + p.label + '</span><input data-prop="' + p.id + '" placeholder="' + p.ph + '" value="' + value + '" spellcheck="false"></label>';
                }).join('');
                el.innerHTML = [
                    '<div class="mdt-bp-node-head" style="border-color:' + def.color + '">',
                    '  <span class="mdt-bp-dot" style="background:' + def.color + '"></span>',
                    '  <span class="mdt-bp-node-title">' + def.title + '</span>',
                    '  <button class="mdt-bp-node-del" title="Supprimer">' + svg('close') + '</button>',
                    '</div>',
                    '<div class="mdt-bp-node-body">' + propsHtml + '</div>',
                    '<div class="mdt-bp-ports">',
                    def.hasIn === false ? '<span></span>' : '<span class="mdt-bp-port in" title="Entrée"></span>',
                    '  <span class="mdt-bp-port out" title="Sortie"></span>',
                    '</div>'
                ].join('');

                el.querySelector('.mdt-bp-node-del').addEventListener('click', function () { removeNode(node.id); });
                el.querySelectorAll('[data-prop]').forEach(function (inputEl) {
                    inputEl.addEventListener('input', function () {
                        node.props[inputEl.dataset.prop] = inputEl.value;
                    });
                    inputEl.addEventListener('pointerdown', function (e) { e.stopPropagation(); });
                });

                var head = el.querySelector('.mdt-bp-node-head');
                var drag = null;
                head.addEventListener('pointerdown', function (e) {
                    if (e.target.closest('button')) return;
                    e.preventDefault();
                    e.stopPropagation();
                    drag = { px: e.clientX, py: e.clientY, ox: node.x, oy: node.y };
                    head.setPointerCapture(e.pointerId);
                });
                head.addEventListener('pointermove', function (e) {
                    if (!drag) return;
                    if (e.buttons === 0) { drag = null; return; }
                    node.x = drag.ox + (e.clientX - drag.px);
                    node.y = drag.oy + (e.clientY - drag.py);
                    el.style.left = node.x + 'px';
                    el.style.top = node.y + 'px';
                    renderEdges();
                });
                head.addEventListener('pointerup', function (e) {
                    drag = null;
                    try { head.releasePointerCapture(e.pointerId); } catch (err) { }
                });

                el.querySelector('.mdt-bp-port.out').addEventListener('pointerdown', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    bp.graph.edges = bp.graph.edges.filter(function (edge) { return edge.from !== node.id; });
                    bp.linking = { from: node.id, pos: null };
                    renderEdges();
                });
                var inPort = el.querySelector('.mdt-bp-port.in');
                if (inPort) {
                    inPort.addEventListener('pointerup', function (e) {
                        e.stopPropagation();
                        if (bp.linking && bp.linking.from !== node.id) {
                            bp.graph.edges = bp.graph.edges.filter(function (edge) { return edge.to !== node.id; });
                            bp.graph.edges.push({ from: bp.linking.from, to: node.id });
                        }
                        bp.linking = null;
                        renderEdges();
                    });
                    inPort.addEventListener('pointerdown', function (e) {
                        e.stopPropagation();
                        bp.graph.edges = bp.graph.edges.filter(function (edge) { return edge.to !== node.id; });
                        renderEdges();
                    });
                }

                nodesEl.appendChild(el);
            });
            renderEdges();
        }

        canvas.addEventListener('pointermove', function (e) {
            if (!bp.linking) return;
            var rect = canvas.getBoundingClientRect();
            bp.linking.pos = { x: e.clientX - rect.left, y: e.clientY - rect.top };
            renderEdges();
        });
        canvas.addEventListener('pointerup', function () {
            if (bp.linking) {
                bp.linking = null;
                renderEdges();
            }
        });

        var panDrag = null;
        canvas.addEventListener('pointerdown', function (e) {
            if (e.target !== canvas && e.target !== edgesEl && e.target !== nodesEl) return;
            panDrag = { px: e.clientX, py: e.clientY, ox: bp.pan.x, oy: bp.pan.y };
        });
        canvas.addEventListener('pointermove', function (e) {
            if (!panDrag) return;
            if (e.buttons === 0) { panDrag = null; return; }
            bp.pan.x = panDrag.ox + (e.clientX - panDrag.px);
            bp.pan.y = panDrag.oy + (e.clientY - panDrag.py);
            nodesEl.style.transform = 'translate(' + bp.pan.x + 'px,' + bp.pan.y + 'px)';
            renderEdges();
        });
        canvas.addEventListener('pointerup', function () { panDrag = null; });

        function refreshList() {
            nui('blueprint:list', {}).then(function (r) {
                bp.list = (r && r.blueprints) || [];
                selectEl.innerHTML = '<option value="">— Blueprints —</option>';
                bp.list.forEach(function (item) {
                    var opt = document.createElement('option');
                    opt.value = item.id;
                    opt.textContent = item.name + (item.enabled ? ' ●' : '');
                    selectEl.appendChild(opt);
                });
                if (bp.current) selectEl.value = String(bp.current);
            });
        }

        selectEl.addEventListener('change', function () {
            var id = Number(selectEl.value);
            if (!id) return;
            nui('blueprint:load', { id: id }).then(function (r) {
                if (!r || !r.blueprint) { setStatus('Chargement impossible.', 'err'); return; }
                bp.current = r.blueprint.id;
                nameEl.value = r.blueprint.name || '';
                enabledEl.checked = !!r.blueprint.enabled;
                bp.graph = r.blueprint.graph && r.blueprint.graph.nodes ? r.blueprint.graph : { nodes: [], edges: [] };
                bp.nextId = bp.graph.nodes.reduce(function (max, n) {
                    var num = parseInt(String(n.id).replace(/\D/g, ''), 10) || 0;
                    return Math.max(max, num + 1);
                }, 1);
                renderGraph();
                setStatus('Blueprint chargé.');
            });
        });

        body.querySelector('#bp-new').addEventListener('click', function () {
            bp.current = null;
            nameEl.value = '';
            enabledEl.checked = false;
            bp.graph = { nodes: [], edges: [] };
            selectEl.value = '';
            renderGraph();
            setStatus('Nouveau blueprint.');
        });

        body.querySelector('#bp-save').addEventListener('click', function () {
            var name = nameEl.value.trim();
            if (!name) { setStatus('Donnez un nom au blueprint.', 'err'); return; }
            setStatus('Enregistrement...');
            nui('blueprint:save', {
                id: bp.current,
                name: name,
                enabled: enabledEl.checked,
                graph: bp.graph
            }).then(function (r) {
                if (r && r.ok) {
                    bp.current = r.id;
                    setStatus('Enregistré' + (enabledEl.checked ? ' et actif.' : '.'), 'ok');
                    refreshList();
                } else {
                    setStatus((r && r.error) || 'Échec de l\'enregistrement.', 'err');
                }
            });
        });

        body.querySelector('#bp-delete').addEventListener('click', function () {
            if (!bp.current) { setStatus('Aucun blueprint sélectionné.', 'err'); return; }
            nui('blueprint:delete', { id: bp.current }).then(function (r) {
                if (r && r.ok) {
                    bp.current = null;
                    nameEl.value = '';
                    bp.graph = { nodes: [], edges: [] };
                    renderGraph();
                    refreshList();
                    setStatus('Blueprint supprimé.', 'ok');
                }
            });
        });

        renderGraph();
        refreshList();
    }

    /* ── Ouverture / fermeture ───────────────────────────────── */

    function openShell(data) {
        state.open = true;
        state.scope = data && data.scope ? data.scope : 'dev';
        state.lockedTool = data && data.lockedTool ? data.lockedTool : null;
        state.apiDown = !(data && data.apiUp);
        state.menuOpen = false;
        state.moreOpen = false;
        state.helpOpen = false;
        root.setAttribute('aria-hidden', 'false');
        var initial = state.lockedTool || (data && data.initialTool) || defaultToolFor(state.scope);
        var tool = toolById(initial);
        if (tool && !tool.bridge && !toolDisabled(tool)) openTool(initial);
        else renderAll();
    }

    function closeShell() {
        if (!state.open) return;
        state.open = false;
        state.helpOpen = false;
        state.menuOpen = false;
        root.setAttribute('aria-hidden', 'true');
        nui('moddingShell:close', {});
    }

    window.addEventListener('message', function (event) {
        var payload = event.data && event.data.moddingShell;
        if (!payload) return;
        if (payload.action === 'open') openShell(payload);
        else if (payload.action === 'close') {
            state.open = false;
            root.setAttribute('aria-hidden', 'true');
        } else if (payload.action === 'apiStatus') {
            state.apiDown = !payload.up;
            /* Repli sur l'accueil si l'outil actif dépend de l'API (comportement AVA). */
            var active = toolById(state.activeTool);
            if (state.apiDown && active && requiresApi(active) && state.scope === 'dev' && !state.lockedTool) {
                openTool('home');
            } else {
                renderAll();
            }
        }
    });
})();
