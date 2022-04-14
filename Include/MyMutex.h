
#ifndef _MyMutex_h_
#define _MyMutex_h_ 1

#include "MyCommon.h"

#include <pthread.h>
typedef pthread_mutex_t MyMutexT;

#ifdef __cplusplus
extern "C" {
#endif

/*! \brief mutex object�� ���� �� �ʿ��� �ʱ�ȭ�� ������ ���� �� ����� ��ȯ�Ѵ�..

	\return �����ϸ� ������ mutex�� ��ȯ�ϰ�, �׷��� ������ NULL�� ��ȯ�Ѵ�.
 */
MyMutexT* NewMutex(void);

/*! \brief �־��� mutex object�� �����Ѵ�.

	DeleteMutex()�� ���� �ش� mutex�� �������� �ݳ��� ���� �����Ѵ�.
	\param a_mutex ������ mutex object�� ���� pointer.
 */
void DeleteMutex(MyMutexT* a_mutex);

/*! \brief �־��� mutex object�� �������� ȹ���Ѵ�.

	LockMutex()�� �־��� mutex object�� ���¸� üũ�Ѵ�. ���� LockMutex()�� ȣ��Ǵ� ������, �ش�
mutext object�� �̹� �ٸ� thread�� ���� �����Ǿ� �ִٸ�, LockMutex()�� ȣ���� thread�� �ش� mutext object
�� ������ thread�� UnlockMutex()�� ȣ���Ͽ� �������� �ݳ��� ������ block�ȴ�. �ϳ� �̻��� thread���� block�Ǿ�
���� ���, �������� ���� thread�� �������� �ݳ��ϸ�, block�� thread�� �� �ϳ����� �������� �����ϰ� �Ǹ鼭
block�� Ǯ���� �ȴ�. (�̶� � thread�� �������� �����ϰ� �� ���� �� �� ����.)
<br><br>
	���� �̹� mutex object�� ������ thread�� �ٽ� LockMutex()�� ȣ���ϸ�, �ش� thread�� deadlock�� ������ �ȴ�.
���� mutex object�� �������� ���� thread�� UnlockMutex()�� ȣ���ϸ� ���ǵ��� ���� ���� �߻��Ѵ�.

	\param a_mutex �������� ȹ���ϰ��� �ϴ� mutex object�� ���� pointer.
	\return �����ϸ� TRUE��, �׷��� ������ FALSE�� ��ȯ�Ѵ�.
 */
boolean LockMutex(MyMutexT* a_mutex);

/*! \brief This function unlock the mutex.

	UnlockMutex()�� �־��� mutex object�� �������� �ݳ��Ѵ�. �ϳ� �̻��� thread���� LockMutex()�� ȣ���Ͽ�
block�Ǿ� ���� ��, UnlockMutex()�� ȣ��Ǹ�, block�� thread�� �� �ϳ��� �������� ȹ���Ͽ� block ���¿���
���� ������ �ȴ�. (� thread�� �������� �����ϰ� �� ���� �� �� ����.)

	\param a_mutex �������� �ݳ��ϰ��� �ϴ� mutex object�� ���� pointer.
	\return �����ϸ� TRUE��, �׷��� ������ FALSE�� ��ȯ�Ѵ�.
 */
boolean UnlockMutex(MyMutexT* a_mutex);

#ifdef __cplusplus
}
#endif

#endif // _MyMutex_h_

