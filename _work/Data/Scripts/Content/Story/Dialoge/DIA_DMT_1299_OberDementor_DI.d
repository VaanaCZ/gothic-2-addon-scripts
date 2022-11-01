///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //Así que te has atrevido a acercarte a la puerta del amo, gusano asqueroso.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //¿Tú eres el que tiras de los hilos?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Soy el guardián de los salones de Irdorath, la mayor fuente de poder de Beliar en la tierra. La fuerza divina del amo fluye por mis manos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Si pronuncio una sola palabra, te sumirás en una locura eterna.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Entiendo. Me parece que tengo que librarme de otro intermediario.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Estoy en la última puerta. El mago negro parece ser la clave."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Llévame con tu maestro.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "¿Cuántos más de los tuyos tendré que matar?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "¿Qué se esconde detrás de aquel portal enorme?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "¿Quién es tu amo?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Antes eras discípulo del Durmiente.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //¿Quién es tu amo?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Es un peregrino que camina entre mundos. Su sabiduría divina nos ilumina.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Es el elegido de Beliar, que liberará el reino de los malditos siervos de Innos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Mata a todos aquellos que ponen en duda su magnificencia.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Me resulta familiar.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //¿Qué se esconde detrás de aquel portal enorme?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(Se ríe) No puedes acceder a las estancias de mi señor. No te concederé la oportunidad de abrir el portal.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //Antes eras discípulo del Durmiente.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //Eso fue en el lejano pasado. El amo nos ha abierto los ojos. Nadie podrá detenernos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //El amo nos ha hecho ver cuál es la única manera de encargarse de los infieles.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //¿Cuántos más de los tuyos tendré que matar?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Somos muchos. No te haces una idea de lo numerosos que son aquellos que esperan la hora de la liberación.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Cuando salgamos a la luz, los lamentos inundarán el país.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Liberaremos al mundo de los bárbaros que se hacen llamar Guardianes del Fuego. No vamos a seguir mucho tiempo reunidos en el templo.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Sí.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(Amenazador) ¡Basta de estupideces! Voy a destruirte.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Se debilitará tu vista y tu espíritu desaparecerá en las tinieblas.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(Para sí) Sin ese amuleto de convocación de almas, tendría un problema grave.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



