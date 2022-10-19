//-------------------------------------------------------------------------------------
//				Weitere Buchst�nder in der Magierbibliothek
//-------------------------------------------------------------------------------------
//				Runensteine 
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Rune_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "�������� 1"					);
					Doc_PrintLine	( nDocID,  0, "������ �����"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "�������� 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Runen und Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Rune_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "�������� 1"					);
					Doc_PrintLine	( nDocID,  0, "���� � �����������"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "�������� 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Die Lehren Innos
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Innos_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "�������� 1"					);
					Doc_PrintLine	( nDocID,  0, "������ ������"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "�������� 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Die Gebote Innos
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Innos_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "�������� 1"					);
					Doc_PrintLine	( nDocID,  0, "�������� ������"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "�������� 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};
//-------------------------------------------------------------------------------------
//				Runen des ersten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "������ ����"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "���� 1-�� ����� � �����������, ����������� ��� �� ��������.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "������� ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "�������� ������");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "����� ������");
					Doc_PrintLine	( nDocID,  0, "������ ��������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������ �������");
					Doc_PrintLine	( nDocID,  0, "����� �������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������� ������ �������");
					Doc_PrintLine	( nDocID,  0, "�������� �����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "����� ������� ����, ������ ��������� ���� �� ����������������� ������������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������."					);
					Doc_Show		( nDocID );
	};
};
//-------------------------------------------------------------------------------------
//				Runen des zweiten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_02_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "������ ����"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLines	( nDocID,  0, "���� 2-�� ����� � �����������, ����������� ��� �� ��������.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "�������� ���");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "������� ������");
					Doc_PrintLine	( nDocID,  0, "������� �����");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "����� �����");
					Doc_PrintLine	( nDocID,  0, "����� �����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "����� �����");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "���");
					Doc_PrintLine	( nDocID,  0, "�������� �����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "����� ������� ����, ������ ��������� ���� �� ����������������� ������������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������."					);
					Doc_Show		( nDocID );
	
	};
};  
//-------------------------------------------------------------------------------------
//				Runen des dritten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_03_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "������ ����"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "���� 3-�� ����� � �����������, ����������� ��� �� ��������.");
					Doc_PrintLine	( nDocID,  0, ""	);
					
					
					Doc_PrintLine	( nDocID,  0, "������� ������� �������");
					Doc_PrintLine	( nDocID,  0, "�������� ��������");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "����� �������� ����");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "�������� �������");
					Doc_PrintLine	( nDocID,  0, "����� �������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "������ ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������� ����");
					Doc_PrintLine	( nDocID,  0, "������� �����");
					Doc_PrintLine	( nDocID,  0, "���������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������� ������");
					Doc_PrintLine	( nDocID,  0, "������ ��������");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  0, "�������� ���");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "");
			
					Doc_PrintLines	( nDocID,  1, "����� ������� ����, ������ ��������� ���� �� ����������������� ������������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������."					);
					Doc_Show		( nDocID );
		
	};
};  	
//-------------------------------------------------------------------------------------
//				Runen des vierten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_04_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "��������� ����"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "���� 4-�� ����� � �����������, ����������� ��� �� ��������.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "������� �������� ���");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������");
					Doc_PrintLine	( nDocID,  0, "������ ��������");
					Doc_PrintLine	( nDocID,  0, "������� �����");
					Doc_PrintLine	( nDocID,  0, "");				
					
					Doc_PrintLine	( nDocID,  0, "����������� ������");
					Doc_PrintLine	( nDocID,  0, "������ ��������� ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "����������� ������");
					Doc_PrintLine	( nDocID,  0, "������ ����");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					
					
					
			
					Doc_PrintLines	( nDocID,  1, "����� ������� ����, ������ ��������� ���� �� ����������������� ������������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������."					);
					Doc_Show		( nDocID );
		
	};
};  					
//-------------------------------------------------------------------------------------
//				Runen des f�nften Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_05_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "����� ����"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "���� 5-�� ����� � �����������, ����������� ��� �� ��������.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "������� �����");
					Doc_PrintLine	( nDocID,  0, "������� �����");
					Doc_PrintLine	( nDocID,  0, "���������");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					Doc_PrintLine	( nDocID,  0, "������� �������� ����");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "�������� ����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "����� ������");
					Doc_PrintLine	( nDocID,  0, "������ ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������� ������� �������");
					Doc_PrintLine	( nDocID,  0, "�������� ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, "����� ������� ����, ������ ��������� ���� �� ����������������� ������������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������."					);
					Doc_Show		( nDocID );
		
	};
};  			
//-------------------------------------------------------------------------------------
//				Runen des sechsten Kreises und ihre Ingredenzien
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Kreise_06_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "������ ����"					);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLines	( nDocID,  0, "���� 6-�� ����� � �����������, ����������� ��� �� ��������.");
					Doc_PrintLine	( nDocID,  0, ""	);
					Doc_PrintLine	( nDocID,  0, ""	);
					
					Doc_PrintLine	( nDocID,  0, "�������� �����");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "����");
					Doc_PrintLine	( nDocID,  0, "�������� ����");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "������� ������");
					Doc_PrintLine	( nDocID,  0, "�����");
					Doc_PrintLine	( nDocID,  0, "������ ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "����� ������");
					Doc_PrintLine	( nDocID,  0, "����� �������");
					Doc_PrintLine	( nDocID,  0, "������ ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					Doc_PrintLine	( nDocID,  0, "����� ����");
					Doc_PrintLine	( nDocID,  0, "����� �������");
					Doc_PrintLine	( nDocID,  0, "������ ������");
					Doc_PrintLine	( nDocID,  0, "������ ��������� ������");
					Doc_PrintLine	( nDocID,  0,  "������ ������");
					Doc_PrintLine	( nDocID,  0, "");
					
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLine	( nDocID,  1, "����������� �������");
					Doc_PrintLine	( nDocID,  1, "����� �������");
					Doc_PrintLine	( nDocID,  1, "���� ������");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
			
					Doc_PrintLines	( nDocID,  1, "����� ������� ����, ������ ��������� ���� �� ����������������� ������������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������."					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������."					);
					Doc_Show		( nDocID );
		
	};
};  					
//-------------------------------------------------------------------------------------
//				Die Regeln im Kloster
//-------------------------------------------------------------------------------------
FUNC VOID Use_Bookstand_Rules_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, "�������� 1"					);
					Doc_PrintLine	( nDocID,  0, "�������"	);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, "�������� 2"					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

	};
};




