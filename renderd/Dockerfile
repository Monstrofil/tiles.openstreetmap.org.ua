FROM osm_renderd_carto_${CARTO_STYLE_TAG}

# naturalearth serves tiles with wrong Crimea border
# replace them with normal ones
# https://github.com/nvkelso/natural-earth-vector/issues/391
COPY fixed_ne/ne_110m_admin_0_boundary_lines_land.zip \
  /openstreetmap-carto/data/ne_110m_admin_0_boundary_lines_land.zip
RUN rm -rf /openstreetmap-carto/data/ne_110m_admin_0_boundary_lines_land/ \
  && cd /openstreetmap-carto/data/ \
  && unzip ne_110m_admin_0_boundary_lines_land.zip