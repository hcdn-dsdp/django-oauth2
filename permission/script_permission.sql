-- Primero agregar en content_type el perfil Autorizador
INSERT INTO django_content_type(name, app_label, model) VALUES ('Perfil de usuario','Autenticador','perfildeusuario');

-- Luego, obtener el id del perfil autorizador previamente insertado y ejecutar en este caso id=12.
-- Ejempĺo:
-- INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede borrar ordene del dia', 12, 'spd_orddene_delete_servicios-java');
-- EJEMPLO DE FORMATO. IMP!! NO CORRE
-- INSERT INTO auth_permission(name, content_type_id, codename) VALUES ({Permiso para humanos: String}, {id_perfil_content_type: int}, {Código de permiso: String});




-- Script SPD
-- CARGOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Cargos SPD-SP', 12, 'spd_cargos_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Cargos SPD-SP', 12, 'spd_cargos_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Cargos SPD-SP', 12, 'spd_cargos_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Cargos SPD-SP', 12, 'spd_cargos_delete_servicios-parlamentarios');

-- APROBACION_SIMPLE
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Aprobaciones Simples SPD-SP', 12, 'spd_aprobacionsimple_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Aprobaciones Simples SPD-SP', 12, 'spd_aprobacionsimple_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Aprobaciones Simples SPD-SP', 12, 'spd_aprobacionsimple_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Aprobaciones Simples SPD-SP', 12, 'spd_aprobacionsimple_delete_servicios-parlamentarios');

-- COMUNICACION_PEN
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Comunicaciones PEN SPD-SP', 12, 'spd_comunicacionpen_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Comunicaciones PEN SPD-SP', 12, 'spd_comunicacionpen_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Comunicaciones PEN SPD-SP', 12, 'spd_comunicacionpen_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Comunicaciones PEN SPD-SP', 12, 'spd_comunicacionpen_delete_servicios-parlamentarios');

-- COMUNICACION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Comunicaciones SPD-SP', 12, 'spd_comunicaciones_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Comunicaciones SPD-SP', 12, 'spd_comunicaciones_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Comunicaciones SPD-SP', 12, 'spd_comunicaciones_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Comunicaciones SPD-SP', 12, 'spd_comunicaciones_delete_servicios-parlamentarios');

-- DICTAMEN
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Dictamenes SPD-SP', 12, 'spd_dictamenes_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Dictamenes SPD-SP', 12, 'spd_dictamenes_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Dictamenes SPD-SP', 12, 'spd_dictamenes_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Dictamenes SPD-SP', 12, 'spd_dictamenes_delete_servicios-parlamentarios');

-- EXPEDIENTE
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Expedientes SPD-SP', 12, 'spd_expedientes_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Expedientes SPD-SP', 12, 'spd_expedientes_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Expedientes SPD-SP', 12, 'spd_expedientes_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Expedientes SPD-SP', 12, 'spd_expedientes_delete_servicios-parlamentarios');

-- INSISTENCIA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Insistencias SPD-SP', 12, 'spd_insistencias_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Insistencias SPD-SP', 12, 'spd_insistencias_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Insistencias SPD-SP', 12, 'spd_insistencias_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Insistencias SPD-SP', 12, 'spd_insistencias_delete_servicios-parlamentarios');

-- OBSERVACION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Observaciones SPD-SP', 12, 'spd_observaciones_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Observaciones SPD-SP', 12, 'spd_observaciones_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Observaciones SPD-SP', 12, 'spd_observaciones_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Observaciones SPD-SP', 12, 'spd_observaciones_delete_servicios-parlamentarios');

-- PROYECTO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Proyectos SPD-SP', 12, 'spd_proyectos_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Proyectos SPD-SP', 12, 'spd_proyectos_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Proyectos SPD-SP', 12, 'spd_proyectos_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Proyectos SPD-SP', 12, 'spd_proyectos_delete_servicios-parlamentarios');

-- RESULTADO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Resultados SPD-SP', 12, 'spd_resultados_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Resultados SPD-SP', 12, 'spd_resultados_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Resultados SPD-SP', 12, 'spd_resultados_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Resultados SPD-SP', 12, 'spd_resultados_delete_servicios-parlamentarios');

-- SOLICITUD
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Solicitudes SPD-SP', 12, 'spd_solicitudes_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Solicitudes SPD-SP', 12, 'spd_solicitudes_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Solicitudes SPD-SP', 12, 'spd_solicitudes_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Solicitudes SPD-SP', 12, 'spd_solicitudes_delete_servicios-parlamentarios');

-- INVITADOS_GPA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Invitados GPA SPD-SP', 12, 'spd_invitadosgpa_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Invitados GPA SPD-SP', 12, 'spd_invitadosgpa_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Invitados GPA SPD-SP', 12, 'spd_invitadosgpa_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Invitados GPA SPD-SP', 12, 'spd_invitadosgpa_delete_servicios-parlamentarios');

-- INVITADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Invitados SPD-SP', 12, 'spd_invitados_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Invitados SPD-SP', 12, 'spd_invitados_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Invitados SPD-SP', 12, 'spd_invitados_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Invitados SPD-SP', 12, 'spd_invitados_delete_servicios-parlamentarios');

-- LEGISLADOR
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Legisladores SPD-SP', 12, 'spd_legisladores_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Legisladores SPD-SP', 12, 'spd_legisladores_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Legisladores SPD-SP', 12, 'spd_legisladores_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Legisladores SPD-SP', 12, 'spd_legisladores_delete_servicios-parlamentarios');

-- PERSONA_FISICA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Personas Fisicas SPD-SP', 12, 'spd_personasfisicas_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Personas Fisicas SPD-SP', 12, 'spd_personasfisicas_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Personas Fisicas SPD-SP', 12, 'spd_personasfisicas_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Personas Fisicas SPD-SP', 12, 'spd_personasfisicas_delete_servicios-parlamentarios');

-- BLOQUE
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Bloques SPD-SP', 12, 'spd_bloques_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Bloques SPD-SP', 12, 'spd_bloques_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Bloques SPD-SP', 12, 'spd_bloques_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Bloques SPD-SP', 12, 'spd_bloques_delete_servicios-parlamentarios');

-- COMISION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Comisiones SPD-SP', 12, 'spd_comisiones_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Comisiones SPD-SP', 12, 'spd_comisiones_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Comisiones SPD-SP', 12, 'spd_comisiones_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Comisiones SPD-SP', 12, 'spd_comisiones_delete_servicios-parlamentarios');

-- DESPACHO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Despachos SPD-SP', 12, 'spd_despachos_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Despachos SPD-SP', 12, 'spd_despachos_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Despachos SPD-SP', 12, 'spd_despachos_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Despachos SPD-SP', 12, 'spd_despachos_delete_servicios-parlamentarios');

-- GPA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear GPA SPD-SP', 12, 'spd_gpas_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Grupos Parlamentarios de Amistad SPD-SP', 12, 'spd_gpas_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar GPA SPD-SP', 12, 'spd_gpas_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar GPA SPD-SP', 12, 'spd_gpas_delete_servicios-parlamentarios');

-- BOLETIN_ASUNTOS_ENTRADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Boletines de Asuntos Entrados SPD-SP', 12, 'spd_boletinesasuntosentrados_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Boletines de Asuntos Entrados SPD-SP', 12, 'spd_boletinesasuntosentrados_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar BAE SPD-SP', 12, 'spd_boletinesasuntosentrados_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar BAE SPD-SP', 12, 'spd_boletinesasuntosentrados_delete_servicios-parlamentarios');

-- BOLETIN_ASUNTOS_TRATADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Boletines Asuntos Tratados SPD-SP', 12, 'spd_boletinesasuntostratados_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Boletines Asuntos Tratados SPD-SP', 12, 'spd_boletinesasuntostratados_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Boletines Asuntos Tratados SPD-SP', 12, 'spd_boletinesasuntostratados_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Boletines Asuntos Tratados SPD-SP', 12, 'spd_boletinesasuntostratados_delete_servicios-parlamentarios');

-- BOLETIN_NOVEDADES
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Boletines Novedades SPD-SP', 12, 'spd_boletinesnovedades_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Boletines Novedades SPD-SP', 12, 'spd_boletinesnovedades_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Boletines Novedades SPD-SP', 12, 'spd_boletinesnovedades_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Boletines Novedades SPD-SP', 12, 'spd_boletinesnovedades_delete_servicios-parlamentarios');

-- DIARIO_ASUNTOS_ENTRADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Diarios de Asuntos Entrados SPD-SP', 12, 'spd_diariosasuntosentrados_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Diarios de Asuntos Entrados SPD-SP', 12, 'spd_diariosasuntosentrados_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Diarios de Asuntos Entrados SPD-SP', 12, 'spd_diariosasuntosentrados_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Diarios de Asuntos Entrados SPD-SP', 12, 'spd_diariosasuntosentrados_delete_servicios-parlamentarios');

-- ORDEN_DIA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Ordenes del dia SPD-SP', 12, 'spd_ordenesdeldia_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Ordenes del dia SPD-SP', 12, 'spd_ordenesdeldia_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Ordenes del dia SPD-SP', 12, 'spd_ordenesdeldia_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Ordenes del dia SPD-SP', 12, 'spd_ordenesdeldia_delete_servicios-parlamentarios');

-- TRAMITE_PARLAMENTARIO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Tramites Parlamentarios SPD-SP', 12, 'spd_tramitesparlamentarios_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Tramites Parlamentarios SPD-SP', 12, 'spd_tramitesparlamentarios_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Tramites Parlamentarios SPD-SP', 12, 'spd_tramitesparlamentarios_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Tramites Parlamentarios SPD-SP', 12, 'spd_tramitesparlamentarios_delete_servicios-parlamentarios');

-- AUX_ESTADO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Estados SPD-SP', 12, 'spd_estados_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Estados SPD-SP', 12, 'spd_estados_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Estados SPD-SP', 12, 'spd_estados_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Estados SPD-SP', 12, 'spd_estados_delete_servicios-parlamentarios');

-- CITACION_GPA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Citaciones de GPAs SPD-SP', 12, 'spd_citacionesgpa_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Citaciones de GPAs SPD-SP', 12, 'spd_citacionesgpa_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Citaciones de GPAs SPD-SP', 12, 'spd_citacionesgpa_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Citaciones de GPAs SPD-SP', 12, 'spd_citacionesgpa_delete_servicios-parlamentarios');

-- CITACION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Citaciones SPD-SP', 12, 'spd_citaciones_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Citaciones SPD-SP', 12, 'spd_citaciones_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Citaciones SPD-SP', 12, 'spd_citaciones_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Citaciones SPD-SP', 12, 'spd_citaciones_delete_servicios-parlamentarios');

-- FIRMANTES
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Firmantes SPD-SP', 12, 'spd_firmantes_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Firmantes SPD-SP', 12, 'spd_firmantes_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Firmantes SPD-SP', 12, 'spd_firmantes_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Firmantes SPD-SP', 12, 'spd_firmantes_delete_servicios-parlamentarios');

-- GIRO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Giros SPD-SP', 12, 'spd_giros_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Giros SPD-SP', 12, 'spd_giros_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Giros SPD-SP', 12, 'spd_giros_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Giros SPD-SP', 12, 'spd_giros_delete_servicios-parlamentarios');

-- Proyectos GIROS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Giros a traves de Proyectos SPD-SP', 12, 'spd_proyectosgiros_get_servicios-parlamentarios');

-- Proyectos Firmantes
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Firmantes a traves de Proyectos SPD-SP', 12, 'spd_proyectosfirmantes_get_servicios-parlamentarios');

-- LUGAR
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Lugares SPD-SP', 12, 'spd_lugares_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Lugares SPD-SP', 12, 'spd_lugares_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Lugares SPD-SP', 12, 'spd_lugares_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Lugares SPD-SP', 12, 'spd_lugares_delete_servicios-parlamentarios');

-- SANCION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Crear Sanciones SPD-SP', 12, 'spd_sanciones_post_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Sanciones SPD-SP', 12, 'spd_sanciones_get_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Modificar Sanciones SPD-SP', 12, 'spd_sanciones_put_servicios-parlamentarios');
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Eliminar Sanciones SPD-SP', 12, 'spd_sanciones_delete_servicios-parlamentarios');


-- Script WEB
-- CARGOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Cargos WEB-SP', 12, 'webHCDN_cargos_get_servicios-parlamentarios');

-- CITACIONES
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Citaciones WEB-SP', 12, 'webHCDN_citaciones_get_servicios-parlamentarios');

-- APROBACION_SIMPLE
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Aprobaciones Simples WEB-SP', 12, 'webHCDN_aprobacionsimple_get_servicios-parlamentarios');

-- COMUNICACION_PEN
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Comunicaciones PEN WEB-SP', 12, 'webHCDN_comunicacionpen_get_servicios-parlamentarios');

-- COMUNICACION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Comunicaciones WEB-SP', 12, 'webHCDN_comunicaciones_get_servicios-parlamentarios');

-- DICTAMEN
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Dictamenes WEB-SP', 12, 'webHCDN_dictamenes_get_servicios-parlamentarios');

-- EXPEDIENTE
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Expedientes WEB-SP', 12, 'webHCDN_expedientes_get_servicios-parlamentarios');

-- INSISTENCIA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Insistencias WEB-SP', 12, 'webHCDN_insistencias_get_servicios-parlamentarios');

-- OBSERVACION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Observaciones WEB-SP', 12, 'webHCDN_observaciones_get_servicios-parlamentarios');

-- PROYECTO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Proyectos WEB-SP', 12, 'webHCDN_proyectos_get_servicios-parlamentarios');

-- RESULTADO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Resultados WEB-SP', 12, 'webHCDN_resultados_get_servicios-parlamentarios');

-- SOLICITUD
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Solicitudes WEB-SP', 12, 'webHCDN_solicitudes_get_servicios-parlamentarios');

-- INVITADOS_GPA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Invitados GPA WEB-SP', 12, 'webHCDN_invitadosgpa_get_servicios-parlamentarios');

-- INVITADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Invitados WEB-SP', 12, 'webHCDN_invitados_get_servicios-parlamentarios');

-- LEGISLADOR
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Legisladores WEB-SP', 12, 'webHCDN_legisladores_get_servicios-parlamentarios');

-- PERSONA_FISICA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Personas Fisicas WEB-SP', 12, 'webHCDN_personasfisicas_get_servicios-parlamentarios');

-- BLOQUE
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Bloques WEB-SP', 12, 'webHCDN_bloques_get_servicios-parlamentarios');

-- COMISION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Comisiones WEB-SP', 12, 'webHCDN_comisiones_get_servicios-parlamentarios');

-- DESPACHO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Despachos WEB-SP', 12, 'webHCDN_despachos_get_servicios-parlamentarios');

-- GPA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Grupos Parlamentarios de Amistad WEB-SP', 12, 'webHCDN_gpas_get_servicios-parlamentarios');

-- BOLETIN_ASUNTOS_ENTRADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Boletines de Asuntos Entrados WEB-SP', 12, 'webHCDN_boletinesasuntosentrados_get_servicios-parlamentarios');

-- BOLETIN_ASUNTOS_TRATADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Boletines Asuntos Tratados WEB-SP', 12, 'webHCDN_boletinesasuntostratados_get_servicios-parlamentarios');

-- BOLETIN_NOVEDADES
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Boletines Novedades WEB-SP', 12, 'webHCDN_boletinesnovedades_get_servicios-parlamentarios');

-- DIARIO_ASUNTOS_ENTRADOS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Diarios de Asuntos Entrados WEB-SP', 12, 'webHCDN_diariosasuntosentrados_get_servicios-parlamentarios');

-- ORDEN_DIA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Ordenes del dia WEB-SP', 12, 'webHCDN_ordenesdeldia_get_servicios-parlamentarios');

-- TRAMITE_PARLAMENTARIO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Tramites Parlamentarios WEB-SP', 12, 'webHCDN_tramitesparlamentarios_get_servicios-parlamentarios');

-- AUX_ESTADO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Estados WEB-SP', 12, 'webHCDN_estados_get_servicios-parlamentarios');

-- CITACION_GPA
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Citaciones de GPAs WEB-SP', 12, 'webHCDN_citacionesgpa_get_servicios-parlamentarios');

-- CITACION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Citaciones WEB-SP', 12, 'webHCDN_citaciones_get_servicios-parlamentarios');

-- FIRMANTES
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Firmantes WEB-SP', 12, 'webHCDN_firmantes_get_servicios-parlamentarios');

-- GIRO
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Giros WEB-SP', 12, 'webHCDN_giros_get_servicios-parlamentarios');

-- Proyectos GIROS
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Giros a traves de Proyectos WEB-SP', 12, 'webHCDN_proyectosgiros_get_servicios-parlamentarios');

-- Proyectos Firmantes
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Firmantes a traves de Proyectos WEB-SP', 12, 'webHCDN_proyectosfirmantes_get_servicios-parlamentarios');

-- LUGAR
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Lugares WEB-SP', 12, 'webHCDN_lugares_get_servicios-parlamentarios');

-- SANCION
INSERT INTO auth_permission(name, content_type_id, codename) VALUES ('Puede Ver Sanciones WEB-SP', 12, 'webHCDN_sanciones_get_servicios-parlamentarios');


