// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Kde ses tu vzal?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Slu�ebn�ku zla. Pro� ses tu objevil? P�i�el jsi jen kv�li tomu, aby rozs�val d�s a hr�zu?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Nejvy��� z�jmy na�eho shrom�d�n� ti z�stanou utajeny �lov��ku.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Jak se dostanu za ostatn�mi draky?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Co u Innose mus�m ud�lat, abych t� vyk�zal z domova lidsk�ho pokolen�?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Co u Innose mus�m ud�lat, abych t� vyk�zal z domova lidsk�ho pokolen�?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(sm�ch) P�edt�m, ne� bude� moci jednat, mus� nejprve poznat z�jmy na�eho shrom�d�n�.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Nicm�n�, nikdo ti to dobrovoln� neprozrad�.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Jen samotn� Oko m��e rozv�zat na�e jazyky a prozradit na�e skute�n� z�m�ry.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //V ka�d�m p��pad� ti to bude k ni�emu, a� bude� mrtv�.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Doneslo se k n�m, �e sis zvolil cestu drakobijce.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Proto jsme do va�eho sv�ta vyslali na�e potomky, aby zajistili pokra�ov�n� na�eho starobyl�ho rodu.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Jsi ztracen, �lov��ku.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Jeden z drak� mumlal n�co o 'potomstvu' a o pokra�ov�n� rodu. Ob�v�m se, �e sv� ml��ata roznesli po cel�m civilizovan�m sv�t�."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Oko ti zajistilo p��stup. Nicm�n� a� samotn� boj rozhodne, jestli jsi m� v�bec hoden.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Jak se dostanu za ostatn�mi draky?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Pouze m� srdce ti m��e pomoci obnovit moc Oka.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ale nikdy se ti nepoda�� vytrhnout mi srdce.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Kdo t� sem poslal?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Kdo ti rozkazuje? Kdo t� sem poslal?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Na�e budoucnost a dobr� bydlo je v rukou P�na vyu��vaj�c�ho Mocn� slovo. U� brzo mu nebude nikdo schopen vzdorovat.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Jeho dlouh� ruce v�dycky dosahovaly daleko za hranice ��e mrtv�ch. Jeho p��chod napl�uje duchy noci radostn�m o�ek�v�n�m.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //P�em��e va�e lidsk� pokolen� a stane se vl�dcem sv�ta.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //V temnot� nejsme ni��m jin�m ne� p�isluhova�i jeho tv�r�� s�ly.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //P�n sestoup� mezi v�s a pozvedne va�e zubo�en� t�la z popela a vyu�ije jich ke zm�n� b�hu sv�ta.

	B_LogEntry (TOPIC_DRACHENJAGD,"Draci nejsou vlastn�mi p�ny. Slou�� vl�dci, kter� jim nedovoluje vyslovit nic ne� mlhav� proroctv�, jako �e n� p�n p�ijde, zni�� cel� sv�t a tak d�le. Prost� obvykl� v�ci."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Jak m��u zab�t va�eho p�na?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Jak m��u zab�t va�eho P�na?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Je v�emohouc� a t�m�� neporaziteln�. Pokud bude� tak po�etil� a p�esto se s n�m setk�, zem�e� pomalou a bolestivou smrt�.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //To nesly��m poprv�. T�m�� �pln� nezranitelnost neznamen�, �e ho nem��u zab�t.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //No, skon�eme to: Co mus�m ud�lat?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Aby ses mohl postavit m�mu P�nu, mus� si opat�it p�edm�ty, je� on nen� schopen jakkoli z�skat.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //A co to m� b�t?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Mus� z�skat tu nejlep�� zbroj, jakou va�e pozemsk� spole�nost kdy poznala, a chr�nit si j� svou k��i.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Pot�ebuje� me�, jen� byl posv�cen va��m bohem.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Pot�ebuje� runu, kter� bude vyrobena jen pro tebe.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Pot�ebuje� zbra�, ji� vyrobili jen pro tv� pou�it�.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ale tou nejtꞚ� podm�nkou je, �e mus� z�skat p�t spole�n�k�, kte�� budou ochotni t� n�sledovat i na druh� b�eh.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Jedin� tak se m��e� odv�it postavit na�emu P�nu.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Jak m��u nal�zt va�eho p�na?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Jak m��u nal�zt va�eho P�na?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Postavil si �kryt v pevn� sk�le Irdorathsk�ch s�n� a �ek� tam na sv�j osud.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Do t� doby, ne� bude schopen obnovit podobu sv�ta, je� mu byla p�edur�ena, �ek� tam v hlubok� meditaci a...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //U�et�i m� podrobnost�. Prost� mi �ekni, kde najdu ty Irdorathsk� s�n�.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Zklamal jsi m�, �lov��ku. Dok�zals p�ekonat v�echna nebezpe�� a porazit v�echny z n�s, a te� skon�� na tom, �e nedok�e� pochopit vy��� v�d�n�.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Pokud ti Irdorath nic ne��k�, pak ud�l� l�p, kdy� zajde� za va�imi m�gy a po��d� je, aby si uspo��dali sv� sv�tsk� z�le�itosti.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Je v�ce ne� z�ejm�, �e je�t� nejsi p�ipraven na t�k� b��m� vy���ho vzd�l�n�.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"P�n drak� pr� s�dl� na mohutn� sk�le v posv�tn�ch Irdorathsk�ch s�n�ch. Hmm. To je mi n�jak pov�dom� - kde jsem o tom jenom �etl?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













